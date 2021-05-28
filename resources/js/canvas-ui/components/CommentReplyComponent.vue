<template>
  <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12 mt-5">
    <div class="posts-comment">
      <h4 class="my-4 border-bottom mt-5 pb-2">
        <span class="border-bottom border-dark pb-2">Comments</span>
      </h4>
      <!-- Post Comment Section -->
      <div
        v-for="comment in post_comments"
        :key="comment.id"
        class="card border-0 mb-2"
      >
        <div class="card-body">
          <h5 class="card-title">{{ comment.name }}</h5>
          <h6 class="card-subtitle mb-2 text-muted">
            Commented on {{ comment.post_id }}
          </h6>
          <p class="card-text">
            {{ comment.comment }}
          </p>

          <!-- Popover in Post Comment Section-->
          <a
            class="card-link pointer"
            :id="'popover-reply-' + comment.id"
            variant="primary"
            >Reply</a
          >
          <b-popover
            ref="popover"
            :target="'popover-reply-' + comment.id"
            placement="rightbottom"
          >
            <p>Reply to {{ comment.name }}</p>
            <form onsubmit="return false">
              <template v-if="!guest.isSavedCredential">
                <div class="mb-3 mt-3">
                  <label for="exampleInputEmail1" class="form-label"
                    >Email address</label
                  >
                  <input
                    type="email"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    v-model="guest.email"
                  />
                </div>
                <div class="mb-3">
                  <label for="nameInput" class="form-label">Name</label>
                  <input
                    type="text"
                    class="form-control"
                    id="nameInput"
                    v-model="guest.name"
                  />
                </div>
              </template>
              <div class="mb-3">
                <label for="commentInput" class="form-label">Your Reply</label>
                <textarea
                  class="form-control"
                  id="commentInput"
                  v-model="guest.reply"
                />
              </div>
              <div class="mb-3 form-check">
                <input
                  type="checkbox"
                  class="form-check-input"
                  id="exampleCheck2"
                  v-model="guest.isSavedCredential"
                  @change="check"
                />
                <label class="form-check-label" for="exampleCheck2"
                  >Save my name and email</label
                >
              </div>
              <button
                @click="
                  postReplyComment({
                    reply_to: comment.name,
                    comment_section_id: comment.id,
                  })
                "
                class="btn btn-primary"
              >
                Post Reply
              </button>
            </form>
          </b-popover>
          <!-- End of Popover in Post Comment Section-->

          <!-- Comment Replies Section -->
          <div v-if="comment.reply.length">
            <div v-for="reply in comment.reply" :key="reply.id">
              <div class="card border-0 mb-2 mt-2">
                <div class="card-body">
                  <h5 class="card-title">{{ reply.name }}</h5>
                  <h6 class="card-subtitle mb-2 text-muted">
                    Replied to {{ reply.reply_to }}
                  </h6>
                  <p class="card-text">{{ reply.comment }}</p>

                  <!-- Popover in Reply Comment Section-->
                  <a v-if="reply.email != guest.email"
                    class="card-link pointer"
                    :id="'popover-reply-' + reply.id"
                    variant="primary"
                    >Reply</a
                  >
                  <b-popover
                    ref="popover"
                    :target="'popover-reply-' + reply.id"
                    placement="rightbottom"
                  >
                    <p>Reply to {{ reply.name }}</p>
                    <form onsubmit="return false">
                      <template v-if="!guest.isSavedCredential">
                        <div class="mb-3 mt-3">
                          <label for="exampleInputEmail1" class="form-label"
                            >Email address</label
                          >
                          <input
                            type="email"
                            class="form-control"
                            id="exampleInputEmail1"
                            aria-describedby="emailHelp"
                            v-model="guest.email"
                          />
                        </div>
                        <div class="mb-3">
                          <label for="nameInput" class="form-label">Name</label>
                          <input
                            type="text"
                            class="form-control"
                            id="nameInput"
                            v-model="guest.name"
                          />
                        </div>
                      </template>
                      <div class="mb-3">
                        <label for="commentInput" class="form-label"
                          >Your Reply</label
                        >
                        <textarea
                          class="form-control"
                          id="commentInput"
                          v-model="guest.reply"
                        />
                      </div>
                      <div class="mb-3 form-check">
                        <input
                          type="checkbox"
                          class="form-check-input"
                          id="exampleCheck2"
                          v-model="guest.isSavedCredential"
                          @change="check"
                        />
                        <label class="form-check-label" for="exampleCheck2"
                          >Save my name and email</label
                        >
                      </div>
                      <button
                        @click="
                          postReplyComment({
                            reply_to: reply.name,
                            comment_section_id: comment.id,
                          })
                        "
                        class="btn btn-primary"
                      >
                        Post Reply
                      </button>
                    </form>
                  </b-popover>
                  <!--End of Popover in Reply Comment Section-->
                </div>
              </div>
            </div>
          </div>
          <!-- End of Comment Replies Section -->
        </div>
      </div>
      <!-- End of Post Comment Section -->
    </div>

    <!-- Write Post Comment -->
    <form onsubmit="return false" class="mt-4">
      <template v-if="!guest.isSavedCredential">
        <div class="mb-3 mt-3">
          <label for="exampleInputEmail1" class="form-label"
            >Email address</label
          >
          <input
            type="email"
            class="form-control"
            id="exampleInputEmail1"
            aria-describedby="emailHelp"
            v-model="guest.email"
          />
        </div>
        <div class="mb-3">
          <label for="nameInput" class="form-label">Name</label>
          <input
            type="text"
            class="form-control"
            id="nameInput"
            v-model="guest.name"
          />
        </div>
      </template>
      <div class="mb-3">
        <label for="commentInput" class="form-label">Your Comment</label>
        <textarea
          class="form-control"
          id="commentInput"
          v-model="guest.comment"
        />
      </div>
      <div class="mb-3 form-check">
        <input
          type="checkbox"
          class="form-check-input"
          v-model="guest.isSavedCredential"
          id="exampleCheck1"
          @change="check"
        />
        <label class="form-check-label" for="exampleCheck1"
          >Save my name and email</label
        >
      </div>
      <button @click="postComment" class="btn btn-primary">Post Comment</button>
    </form>
  </div>
</template>

<script>
export default {
  name: "CommentReplyComponent",

  props: {
    post_id: '',
  },

  data() {
    return {
      guest: {
        name: "",
        email: "",
        comment: "",
        reply: "",
        isSavedCredential: false,
      },

      post_comments: [
        {
          id: 123,
          post_id: this.post_id,
          name: "Septian",
          email: "septian@mail.com",
          comment: "Great content!",
          reply: [
            {
              id: 111,
              comment_section_id: 123,
              name: "iyan",
              email: "iyan@mail.com",
              comment: "i know right",
              reply_to: "Septian",
            },
            {
              id: 222,
              comment_section_id: 123,
              name: "brando",
              email: "brando@mail.com",
              comment: "yyyy",
              reply_to: "iyan",
            },
          ],
        },
        {
          id: 456,
          post_id: this.post_id,
          name: "Mamank Garok",
          email: "garok@mail.com",
          comment: "Thx!",
          reply: [],
        },
      ],
    };
  },

  created() {
    if (localStorage.getItem("ayocode_saved_credential")) {
      const data = JSON.parse(localStorage.getItem("ayocode_saved_credential"));
      this.guest.name = data.guest.name;
      this.guest.email = data.guest.email;

      this.guest.isSavedCredential = true;
    }
  },

  methods: {
    postComment: function (e) {
      console.log(e);
      this.post_comments.push(
        {
          id: Math.floor(Math.random() * 999),
          post_id: this.post_id,
          name: this.guest.name,
          email: this.guest.email,
          comment: this.guest.comment,
          reply: [],
        }
      );
      this.guest.comment = '';
    },

    postReplyComment: function ({ reply_to, comment_section_id }) {
      const x = this.post_comments.find(({ id }) => id == comment_section_id);
      x.reply.push({
        id: Math.floor(Math.random() * 999),
        comment_section_id: comment_section_id,
        name: this.guest.name,
        email: this.guest.email,
        comment: this.guest.reply,
        reply_to: reply_to,
      });
      this.guest.reply = '';
    },

    check: function (e) {
      this.$nextTick(() => {
        if (this.guest.isSavedCredential) {
          console.log("wlwl");
          if (this.guest.name && this.guest.email) {
            localStorage.setItem(
              "ayocode_saved_credential",
              JSON.stringify({
                guest: {
                  name: this.guest.name,
                  email: this.guest.email,
                },
              })
            );
          } else {
            console.log("email and name required before you save it");
          }
        } else {
          localStorage.removeItem("ayocode_saved_credential");
        }
      });
    },
  },
};
</script>

<style scoped>
.pointer {
  cursor: pointer;
}
</style>