<template>
  <section>
    <page-header />

    <div v-if="isReady">
      <JumbotronComponent />

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
          <span class="border-bottom border-dark pb-2">Topics</span>
        </h4>

        <div v-if="topics.length > 0">
          <router-link
            v-for="topic in topics"
            :key="topic.id"
            :to="{ name: 'show-topic', params: { slug: topic.slug } }"
            class="btn mb-2 text-white"
            :class="getRandomColour()"
            style="margin-right: 5px"
            >{{ topic.name }}</router-link
          >
        </div>
        <div v-else class="my-5">
          <p class="lead text-center text-muted mt-5">You have no topics</p>
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
  name: "all-topics",

  components: {
    PageHeader,
    JumbotronComponent,
  },

  metaInfo() {
    return {
      title: "ayocode | topics",
    };
  },

  data() {
    return {
      topics: [],
      isReady: false,

      colours: ["danger", "info", "primary", "secondary", "success", "warning"],
    };
  },

  async created() {
    await Promise.all([this.fetchTopics()]);
    this.isReady = true;
    NProgress.done();
  },

  methods: {
    fetchTopics() {
      return this.request()
        .get("/api/topics")
        .then(({ data }) => {
          this.topics = data;
          NProgress.inc();
        })
        .catch(() => {
          NProgress.done();
        });
    },

    getRandomColour() {
      return (
        "bg-" + this.colours[Math.floor(Math.random() * this.colours.length)]
      );
    },
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