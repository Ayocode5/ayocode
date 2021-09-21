<template>
  <section>
    <page-header />

    <div v-if="isReady">
      <JumbotronComponent />

      <!-- Posts -->
      <div
        class="
          col-10
          offset-1
          col-xl-8
          offset-xl-2
          col-lg-10
          offset-lg-1
          col-md-10
          offset-md-1
          col-sm-10
          offset-sm-1
          mt-3
        "
      >
        <h4 class="my-4 border-bottom mt-5 pb-2">
          <span class="border-bottom border-dark pb-2">Tags</span>
        </h4>

        <div v-if="tags.length > 0">
          <router-link
            v-for="tag in tags"
            :key="tag.id"
            :to="{ name: 'show-tag', params: { slug: tag.slug } }"
            class="btn mb-2 text-white" :class="getRandomColour()"
            style="margin-right: 5px"
            >{{ tag.name }}</router-link
          >
        </div>
        <div v-else class="my-5">
          <p class="lead text-center text-muted mt-5">You have no tags</p>
          <p class="lead text-center text-muted mt-1">
            Write on the go with our mobile-ready app!
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import NProgress from "nprogress";
import PageHeader from "../components/PageHeaderComponent";
import JumbotronComponent from "../components/JumbotronComponent";

export default {
  name: "all-tags",

  components: {
    PageHeader,
    JumbotronComponent,
  },

  metaInfo() {
    return {
      title: "ayocode | tags",
    };
  },

  data() {
    return {
      tags: [],
      isReady: false,

      colours: ['danger', 'info', 'primary', 'secondary', 'success', 'warning',]
    };
  },

  async created() {
    await Promise.all([this.fetchTags()]);
    this.isReady = true;
    NProgress.done();
  },

  methods: {
    fetchTags() {
      return this.request()
        .get("/api/tags")
        .then(({ data }) => {
          this.tags = data;
          NProgress.inc();
        })
        .catch(() => {
          NProgress.done();
        });
    },

    getRandomColour() {
        return 'bg-' + this.colours[Math.floor(Math.random() * this.colours.length)];
    }
  },
};
</script>

<style scoped>
.card {
  border: none;
  background: rgb(224, 224, 224);
  background: linear-gradient(
    90deg,
    rgba(224, 224, 224, 1) 0%,
    rgba(238, 238, 238, 1) 35%,
    rgba(245, 245, 245, 1) 100%
  );
}
</style>