<template>
  <section>
    <page-header />

    <div v-if="isReady">
      <JumbotronComponent />

      <!-- Posts Card Style v2 -->
      <div class="p-3">
        <div id="post" class="row">
          <!-- Posts -->
          <div
            class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-10"
          >
            <h4 class="mb-4 border-bottom pb-2">
              <span class="border-bottom border-dark pb-2">Featured Posts</span>
            </h4>

            <div v-if="!loadingContent">
              <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <!-- Do Loop Here -->
                <div
                  :key="`${index}-${post.id}`"
                  v-for="(post, index) in posts"
                  class="col mb-2"
                >
                  <router-link
                    :to="{ name: 'show-post', params: { slug: post.slug } }"
                    class="card card-link border-1 h-100"
                  >
                    <div v-if="post.featured_image">
                      <img
                        class="card-img-top"
                        style="height: 200px"
                        :src="post.featured_image"
                        :alt="post.featured_image_caption"
                      />
                    </div>
                    <div v-else>
                      <img
                        class="card-img-top"
                        style="height: 200px"
                        src="https://www.kediri-pringsewu.desa.id/desa/themes/cosmo/assets/images/placeholder.png"
                        alt="no pic"
                      />
                    </div>
                    <div class="card-body">
                      <h4 class="card-title">
                        {{ post.title }}
                      </h4>
                      <p class="card-text cut-text">
                        {{ post.summary }}
                      </p>
                      <strong>{{ post.read_time }} to read.</strong>

                      <div class="row-cols-auto">
                        <span>Tags:</span>

                        <!-- <span class="badge bg-info">Programming</span>
                      <span class="badge bg-warning">Javascript</span> -->
                        <span v-if="post.tags.length" class="col">
                          <!-- <span
                            v-for="(tag, index) in post.tags"
                            :key="'tag' + index"
                            class="badge"
                            :class="getRandomColour()"
                            style="margin-left: 2px"
                          >
                            {{ tag.name }}
                          </span> -->
                          <router-link
                            v-for="(tag, index) in post.tags"
                            :key="'tag' + index"
                            :to="{
                              name: 'show-tag',
                              params: { slug: tag.slug },
                            }"
                            class="badge text-decoration-none text-white"
                            :class="getRandomColour()"
                            style="margin-right: 3px"
                          >
                            {{ tag.name }}
                          </router-link>
                        </span>
                      </div>                      
                    </div>
                    <div class="card-footer border-0 bg-light">
                      <div class="row row-cols-auto">
                        <div class="mr-1 ml-1">
                          <img
                            :src="post.user.default_avatar"
                            class="author-avatar"
                            alt="..."
                          />
                        </div>
                        <div class="col" style="margin-left: -10px">
                          <p class="card-text">
                            {{ post.user.name }}
                            <i class="fas fa-pen"></i><br />
                            Published at
                            {{ moment(post.published_at).format("MMM D, Y") }}
                          </p>
                        </div>
                      </div>
                    </div>
                  </router-link>
                </div>
              </div>
            </div>
            <center v-else>
              <div class="lds-facebook">
                <div></div>
                <div></div>
                <div></div>
              </div>
            </center>

            <!-- If posts are not exists -->
            <div v-if="!posts">
              <div slot="no-results" class="text-left">
                <div class="my-5">
                  <p class="lead text-center text-muted mt-5">
                    You have no published posts
                  </p>
                </div>
              </div>
            </div>

            <!-- Pagination -->
            <div v-else class="mt-3">
              <h4 class="border-bottom mt-2"></h4>
              <b-pagination
                pills
                v-model="pagination.page"
                :total-rows="pagination.rows"
                :per-page="pagination.perPage"
                first-number
                last-number
                align="center"
              ></b-pagination>
            </div>
          </div>

          <!-- Popular Posts -->
          <div class="col col-sm-0 col-md-0 col-lg-0 col-xl-0 col-xxl-2">
            <popular-posts-component />
          </div>
        </div>
      </div>

      <PageFooterComponent />
    </div>
  </section>
</template>

<script>
import InfiniteLoading from "vue-infinite-loading";
import NProgress from "nprogress";
import PageHeader from "../components/PageHeaderComponent";
import JumbotronComponent from "../components/JumbotronComponent";
import PopularPostsComponent from "../components/PopularPostsComponent";
import PageFooterComponent from "../components/PageFooterComponent";
import isEmpty from "lodash/isEmpty";

export default {
  name: "all-posts",

  components: {
    InfiniteLoading,
    PageHeader,
    JumbotronComponent,
    PopularPostsComponent,
    PageFooterComponent,
  },

  metaInfo() {
    return {
      title: "Ayocode Blogs",
    };
  },

  data() {
    return {
      isReady: false,

      pagination: {
        page: 1, // Pagination Variable
        rows: 0,
        perPage: 0,
      },

      posts: [],

      loadingContent: false,

      colours: ["danger", "info", "primary", "secondary", "success", "warning"],

      error: {
        // Error Message
        status: Number,
        message: String,
      },
    };
  },

  async created() {
    await Promise.all([this.fetchPosts(this.pagination.page)]);
    this.isReady = true;
    NProgress.done();
  },

  methods: {
    fetchPosts(page, $state) {
      return this.request()
        .get("api/posts", {
          params: {
            page: page,
            limit: 3,
          },
        })
        .then(({ data }) => {
          if (!isEmpty(data) && !isEmpty(data.data)) {
            this.posts.push(...Object.values(data.data));
            this.pagination.rows = data.total;
            this.pagination.perPage = data.per_page;

            NProgress.done();
          } else {
            this.posts = null;
          }

          if (isEmpty($state)) {
            NProgress.inc();
          }
        })
        .catch((err) => {
          // console.log(err);

          NProgress.done();
        });
    },

    getRandomColour() {
      return (
        "bg-" + this.colours[Math.floor(Math.random() * this.colours.length)]
      );
    },
  },

  watch: {
    "pagination.page": async function () {
      this.posts = [];
      this.loadingContent = true;

      await Promise.all([this.fetchPosts(this.pagination.page)]);
      this.loadingContent = false;
      NProgress.done();
    },
  },
};
</script>

<style scoped>
/* Posts Card Style */
.card-link {
  text-decoration: none;
  color: rgb(22, 22, 22);
}

.card-link:hover {
  color: rgb(85, 85, 85);
}

.author-avatar {
  height: 50px;
  width: 50px;
  border-radius: 50%;
}

#post {
  margin: 3% 10%;
}

@media (max-width: 576px) {
  #post {
    margin: 3% auto;
  }
}
/*End Posts Card Style */

.cut-text {
  white-space: nowrap;
  width: 250px;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Loading Progress Animation */
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
  background: rgb(131, 131, 131);
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
/* End Loading Progress Animation */
</style>

<style>
/* Pagination Button Style */
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

*:focus {
  outline: 0 !important;
  box-shadow: none !important;
}

*:focus:not(:focus-visible) {
  outline: 0 !important;
  box-shadow: none !important;
}
/* End Of Pagination Button Style */
</style>