<template>
  <section>
    <page-header />

    <div v-if="isReady" class="mt-5">
      <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12 mt-3">
        <JumbotronBlog />
        <main role="main" class="mt-5">
          <div>
            <!-- Featured Posts -->
            <h4 class="my-4 border-bottom mt-5 pb-2">
              <span class="border-bottom border-dark pb-2">Featured Posts</span>
            </h4>

            <div v-if="!loadingContent">
              <div :key="`${index}-${post.id}`" v-for="(post, index) in posts">
                <router-link
                  :to="{ name: 'show-post', params: { slug: post.slug } }"
                  class="text-decoration-none"
                >
                  <div class="card mb-4 shadow">
                    <div class="card-body px-0">
                      <div
                        class="container d-lg-inline-flex align-items-center"
                      >
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
            </div>
            <center v-else>
              <div class="lds-facebook">
                <div></div>
                <div></div>
                <div></div>
              </div>
            </center>

            <div v-if="!posts">
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
            </div>

            <div v-else class="mt-3">
              <h4 class="border-bottom mt-2"></h4>
              <b-pagination
                pills
                v-model="page"
                :total-rows="rows"
                :per-page="perPage"
                first-number
                last-number
                align="center"
              ></b-pagination>
            </div>

            <!-- End Featured Posts -->
          </div>
        </main>
      </div>

      <popular-posts-component />
      <Footer />
    </div>
  </section>
</template>

<script>
import InfiniteLoading from "vue-infinite-loading";
import NProgress from "nprogress";
import PageHeader from "../components/PageHeaderComponent";
import JumbotronBlog from "../components/JumbotronBlog";
import PopularPostsComponent from "../components/PopularPostsComponent";
import Footer from "../components/Footer";
import isEmpty from "lodash/isEmpty";

export default {
  name: "all-posts",

  components: {
    InfiniteLoading,
    PageHeader,
    JumbotronBlog,
    PopularPostsComponent,
    Footer,
  },

  metaInfo() {
    return {
      title: "Ayocode Blogs",
    };
  },

  data() {
    return {
      page: 1,
      rows: 0,
      perPage: 0,
      posts: [],
      isReady: false,
      loadingContent: false,
    };
  },

  async created() {
    await Promise.all([this.fetchPosts(this.page)]);
    this.isReady = true;
    NProgress.done();
  },

  methods: {
    fetchPosts(page) {
      return this.request()
        .get("api/posts", {
          params: {
            page: page,
          },
        })
        .then(({ data }) => {
          if (!isEmpty(data) && !isEmpty(data.data)) {
            this.posts.push(...Object.values(data.data));
            this.rows = data.total;
            this.perPage = data.per_page;
          } else {
            this.posts = null;
          }

          if (isEmpty($state)) {
            NProgress.inc();
          }
        })
        .catch((err) => {
          NProgress.done();
        });
    },
  },

  watch: {
    page: async function () {
      this.posts = [];
      this.loadingContent = true;

      await Promise.all([this.fetchPosts(this.page)]);
      this.loadingContent = false;
    },
  },
};
</script>

<style>
.lds-facebook {
  display: inline-block;
  position: relative;
  width: 80px;
  height: 80px;
}
.lds-facebook div {
  display: inline-block;
  position: absolute;
  left: 8px;
  width: 16px;
  background: rgb(201, 201, 201);
  animation: lds-facebook 1.2s cubic-bezier(0, 0.5, 0.5, 1) infinite;
}
.lds-facebook div:nth-child(1) {
  left: 8px;
  animation-delay: -0.24s;
}
.lds-facebook div:nth-child(2) {
  left: 32px;
  animation-delay: -0.12s;
}
.lds-facebook div:nth-child(3) {
  left: 56px;
  animation-delay: 0;
}
@keyframes lds-facebook {
  0% {
    top: 8px;
    height: 64px;
  }
  50%,
  100% {
    top: 24px;
    height: 32px;
  }
}

*:focus {
  outline: 0 !important;
  box-shadow: none !important;
}

*:focus:not(:focus-visible) {
  outline: 0 !important;
  box-shadow: none !important;
}

.page-link {
  border: none;
  margin: 1px;
}

.page-link:hover {
  z-index: 2;
  color: black;
  text-decoration: none;
  background-color: #ffffff;
  border-color: #ffffff;
  border-bottom: 2px solid #eda5fc;
}

.page-item:last-child .page-link {
  border-top-right-radius: 0px;
  border-bottom-right-radius: 0px;
}

.page-item:first-child .page-link {
  border-top-left-radius: 0px;
  border-bottom-left-radius: 0px;
}

.page-item.active .page-link {
  z-index: 3;
  color: #be53d3;
  border: none;
  background-color: white;
  /* border-color: #be53d3; */
  border-bottom: 2px solid #be53d3;
}
</style>