<template>
  <div>
    <ul>
      <li v-for="(comment, index) in comments" :key="index">
        {{ comment }}
      </li>
    </ul>
  </div>
</template>

<script>
import NProgress from "nprogress";

export default {
  name: "Discussions",
  data() {
    return {
      comments: [],
    };
  },

  created() {
    NProgress.done();
  },

  mounted() {

    var pusher = new Pusher("2488eae3377da13c3129", {
      cluster: "ap1"
    });

    var channel = pusher.subscribe("postDiscussionsChannel");
    channel.bind("NewDiscussionEvent", function (data) {
      console.log(data)
    });
  },
};
</script>

<style>
</style>