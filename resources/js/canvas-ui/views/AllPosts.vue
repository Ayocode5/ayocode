<template>
  <section>
    <page-header />

    <div v-if="isReady" class="mt-5">
      <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12 mt-3">
        <JumbotronBlog />
        <main role="main" class="mt-5">
          <div>
            <h4 class="my-4 border-bottom mt-5 pb-2">
              <span class="border-bottom border-dark pb-2">Featured Posts</span>
            </h4>

            <div :key="`${index}-${post.id}`" v-for="(post, index) in posts">
              <router-link
                :to="{ name: 'show-post', params: { slug: post.slug } }"
                class="text-decoration-none"
              >
                <div class="card mb-4 shadow">
                  <div class="card-body px-0">
                    <div class="container d-lg-inline-flex align-items-center">
                      <div
                        v-if="post.featured_image"
                        class="col-12 col-lg-3 p-0"
                      >
                        <img
                          :src="post.featured_image"
                          :alt="post.featured_image_caption"
                          class="rounded w-100"
                        />
                      </div>
                      <section
                        class="col-12 mt-3 mt-lg-0 px-0 px-lg-3"
                        :class="post.featured_image ? 'col-lg-9' : ''"
                      >
                        <h5 class="card-title text-truncate mb-0">
                          {{ post.title }}
                        </h5>
                        <p class="card-text text-truncate">
                          {{ post.summary }}
                        </p>
                        <p class="card-text mb-0 text-secondary">
                          {{ post.user.name }}
                          <span v-if="post.topic.length">
                            in {{ post.topic[0].name }}
                          </span>
                        </p>
                        <p class="card-text text-secondary">
                          {{ moment(post.published_at).format("MMM D, Y") }} —
                          {{ post.read_time }}
                        </p>
                      </section>
                    </div>
                  </div>
                </div>
              </router-link>
            </div>

            <infinite-loading
              spinner="spiral"
              :identifier="infiniteId"
              @infinite="fetchPosts"
            >
              <span slot="no-more" />
              <div slot="no-results" class="text-left">
                <div class="my-5">
                  <p class="lead text-center text-muted mt-5">
                    You have no published posts
                  </p>
                  <p class="lead text-center text-muted mt-1">
                    Write on the go with our mobile-ready app!
                  </p>
                </div>
              </div>
            </infinite-loading>

            <div v-if="noMatchPost">
                <div class="my-5">
                  <p class="lead text-center text-muted mt-5">
                    Blog not found!
                  </p>
                  <p class="lead text-center text-muted mt-1">
                    Pala aing pusing gara2 ngoding mulu :)
                  </p>
                </div>
            </div>

          </div>
        </main>
      </div>
    <Footer />
     
    </div>
  </section>
</template>

<script>
import InfiniteLoading from "vue-infinite-loading";
import NProgress from "nprogress";
import PageHeader from "../components/PageHeaderComponent";
import JumbotronBlog from "../components/JumbotronBlog";
import Footer from "../components/Footer";
import isEmpty from "lodash/isEmpty";

export default {
  name: "all-posts",

  components: {
    InfiniteLoading,
    PageHeader,
    JumbotronBlog,
    Footer,
  },

  metaInfo() {
    return {
      title: "ayocode | posts",
    };
  },

  data() {
    return {
      page: 1,
      posts: [],
      isReady: false,
      noMatchPost: false,
      infiniteId: 1,
      keyword: "",
    };
  },

  async created() {
    await Promise.all([this.fetchPosts()]);
    this.isReady = true;
    NProgress.done();
  },

  methods: {
    fetchPosts($state) {
      if ($state) {
        return this.request()
          .get("api/posts", {
            params: {
              search: this.keyword,
              page: this.page,
            },
          })
          .then(({ data }) => {
            if (!isEmpty(data) && !isEmpty(data.data)) {
              this.page += 1;
              this.posts.push(...Object.values(data.data));

              $state.loaded();
            } else {
              $state.complete();
            }

            if (isEmpty($state)) {
              NProgress.inc();
            }
          })
          .catch((err) => {
            NProgress.done();
          });
      }
    },

    async searchPost(keyword) {
      this.keyword = keyword;
      this.page = 2;

      if (keyword) {
        this.posts = [];

        this.request()
          .get("api/posts", {
            params: {
              search: keyword,
            },
          })
          .then(({ data }) => {
            if (!isEmpty(data) && !isEmpty(data.data)) {
              this.posts.push(...data.data);
              this.noMatchPost = false;

              //This line code will trigger infinite loading, if the given last_page is higher than 1
              data.last_page > 1 ? (this.infiniteId += 1) : "";
            }
          })
          .catch((err) => {
            if (err.response.status == 404) {
              this.posts = [];
              this.noMatchPost = true;
            }
          });
      } 
    },
  },
};
</script>
