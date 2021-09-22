<template>
  <!-- Popular Posts -->
  
  <span>
    <h4 class="mb-4 border-bottom pb-2">
      <span class="border-bottom border-dark pb-2">Popular Posts</span>
    </h4>

    <div>
      <div :key="`${index * 2}-${post.id}`" v-for="(post, index) in posts">
        <router-link
          :to="{ name: 'show-post', params: { slug: post.slug } }"
          class="card card-link border-0 mb-2"
        >
          <div class="card-body p-0" style="margin-left: 2%">
            <h5 class="card-title">{{ post.title }}</h5>
            <h6 v-if="post.topic.length" class="card-subtitle mb-2 text-muted">in {{post.topic[0].name}}</h6>
            <p class="card-text">
              {{ post.summary }}
            </p>
          </div>
        </router-link>
      </div>
    </div>
  
  </span>

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
        .get("api/posts/popular", {
          params: {
            limit: 5,
          },
        })
        .then(({ data }) => {
          this.posts.push(...data);
          // console.log(data)
        })
        .catch((err) => {
          // console.log(err.response.status);
        });
    },
  },
};
</script>

<style scoped>
#post {
  margin: 3% 10%;
}
@media (max-width: 576px) {
  #post {
    margin: 3% auto;
  }
}

/* .card {
  border: none;
  background: rgb(245, 245, 245);
  background: linear-gradient(
    90deg,
    rgba(245, 245, 245, 1) 0%,
    rgba(247, 247, 247, 1) 50%,
    rgba(250, 250, 250, 1) 100%
  );
} */

.card-link {
  text-decoration: none;
  color: rgb(22, 22, 22);
}

.card-link:hover {
  color: rgb(85, 85, 85);
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