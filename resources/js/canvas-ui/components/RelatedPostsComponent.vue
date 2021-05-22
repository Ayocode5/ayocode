<template>
  <div>
    <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12 mt-3">
      <!-- Popular Posts -->
      <h4 class="my-4 border-bottom mt-5 pb-2">
        <span class="border-bottom border-dark pb-2">Related Posts</span>
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
      </div>
      <center v-else>
        <div class="lds-dual-ring">
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
      tag: '',
      current_post_id: ''
    }
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
        .get("api/posts/related?tag="+this.related_params.tag+"&current_post="+this.related_params.current_post_id)
        .then(({ data }) => {
          this.posts.push(...data);
        })
        .catch((err) => console.log(err));
    },
  },
};
</script>

<style scoped>
.lds-dual-ring {
  display: inline-block;
  width: 50px;
  height: 50px;
  text-align: center;
}
.lds-dual-ring:after {
  content: " ";
  display: block;
  width: 64px;
  height: 64px;
  margin: 8px;
  border-radius: 50%;
  border: 6px solid rgb(56, 56, 56);
  border-color: rgb(60, 60, 60) transparent rgb(60, 60, 60) transparent;
  animation: lds-dual-ring 1.2s linear infinite;
}
@keyframes lds-dual-ring {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>