<template>
  <div>
    <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12 mt-3">
      <!-- Popular Posts -->
      <h4 class="my-4 border-bottom mt-5 pb-2">
        <span class="border-bottom border-dark pb-2">Popular Posts</span>
      </h4>

      <div v-if="isReady">
        <div :key="`${index * 2}-${post.id}`" v-for="(post, index) in posts">
          <router-link
            :to="{ name: 'show-post', params: { slug: post.slug } }"
            class="text-decoration-none"
          >
            <div class="card mb-4 shadow">
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
                      <span v-if="post.topic.length">
                        topic {{ post.topic[0].name }}
                      </span>
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
      </div>
      <center v-else>
        <div class="lds-facebook" role="status">
        </div>
      </center>
      <!-- End Popular Posts -->
    </div>
  </div>
</template>
<script>
export default {
  name: "popular-post-component",
  data() {
    return {
      posts: [],
      isReady: false,
    };
  },

  async created() {
    await Promise.all([this.fetchPopularPosts()]);
    this.isReady = true;
  },

  methods: {
    fetchPopularPosts() {
      return this.request()
        .get("api/posts/popular")
        .then(({ data }) => {
          this.posts.push(...data);
        })
        .catch((err) => console.log(err));
    },
  },
};
</script>

<style scoped>
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