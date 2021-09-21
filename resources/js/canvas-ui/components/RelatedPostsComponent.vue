<template>
  <div>
    <div class="col-10 offset-1 col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-sm-10 offset-sm-1 mt-3">
      <!-- Popular Posts -->
      <h4 class="my-4 border-bottom mt-2 pb-2">
        <span class="border-bottom border-dark pb-2">Related Posts</span>
      </h4>

      <div v-if="isReady">
        <div :key="`${index * 2}-${post.id}`" v-for="(post, index) in posts">
          <router-link
            :to="{ name: 'show-post', params: { slug: post.slug } }"
            class="text-decoration-none"
          >
            <div class="card border-0 mb-4 shadow-4">
              <div class="card-body px-0">
                <div class="container d-lg-inline-flex align-items-center">
                  <!-- <div
                        v-if="post.featured_image"
                        class="col-12 col-lg-3 p-0"
                      >
                        <img
                          :src="post.featured_image"
                          :alt="post.featured_image_caption"
                          class="rounded w-100"
                        />
                      </div> -->
                  <i class="fas fa-angle-right"></i>
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
                      <!-- {{ post.user.name }} -->
                      <!-- <span v-if="post.topic.length">
                        topic {{ post.topic[0].name }}
                      </span> -->
                    </p>
                    <!-- <p class="card-text text-secondary">
                          {{ moment(post.published_at).format("MMM D, Y") }} —
                          {{ post.read_time }}
                        </p> -->
                  </section>
                </div>
              </div>
            </div>
          </router-link>
        </div>

        <div v-if="posts.length < 1">
          <div slot="no-results" class="text-left">
            <div class="my-5">
              <p class="lead text-center text-muted mt-5">
                No related post mathed for this post
              </p>
            </div>
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
      <!-- End Popular Posts -->
    </div>
  </div>
</template>
<script>
export default {
  name: "related-post-component",
  props: {
    related_params: {
      topic: "",
      current_post_id: "",
    },
  },

  data() {
    return {
      posts: [],
      isReady: false,
    };
  },

  async created() {
    await Promise.all([this.fetchRelatedPosts()]);
    this.isReady = true;
  },

  methods: {
    fetchRelatedPosts() {
      return this.request()
        .get("api/posts/related", {
          params: {
            topic: this.related_params.topic,
            current_post: this.related_params.current_post_id,
          },
        })
        .then(({ data }) => {
          if (data.length > 0) {
            // console.log(data)
            this.posts.push(...data);
          }
        })
        .catch((err) => console.log(err));
    },
  },
};
</script>

<style scoped>
.card {
  border: none;
  background: rgb(245, 245, 245);
  background: linear-gradient(
    90deg,
    rgba(245, 245, 245, 1) 0%,
    rgba(247, 247, 247, 1) 50%,
    rgba(250, 250, 250, 1) 100%
  );
}

/* Loading Animation */
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
  background: rgb(157, 157, 157);
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
</style>