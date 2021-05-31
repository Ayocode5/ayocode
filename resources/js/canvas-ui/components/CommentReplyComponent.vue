<template>
  <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12 mt-5">
    <div class="posts-comment">
      <h4 class="my-4 border-bottom mt-5 pb-2">
        <span class="border-bottom border-dark pb-2">Discussion</span>
      </h4>
      <!-- Post Comment Section -->
      <div
        v-for="comment in post_comments"
        :key="comment.id"
        class="card border-2 mb-2"
      >
        <div class="card-body">
          <div>
            <img
              style="width: 50px; height: 50px"
              src="https://www.svgrepo.com/show/77591/user.svg"
              alt="user"
            />
            <h5 class="card-title">{{ comment.name }}</h5>
            <h6 class="card-subtitle mb-2 text-muted">
              Commented on {{ post_slug }}
            </h6>
          </div>

          <p class="card-text">
            {{ comment.comment }}
          </p>

          <!-- Popover in Post Comment Section-->
          <a
            class="card-link pointer"
            :id="'popover-reply-' + comment.id"
            variant="primary"
            ><i class="fas fa-reply"></i>&nbsp;Reply</a
          >
          <b-popover
            ref="popover"
            :target="'popover-reply-' + comment.id"
            placement="rightbottom"
          >
            <p class="badge badge-secondary py-2 px-2">
              Reply to {{ comment.name }}
            </p>
            <form onsubmit="return false">
              <template v-if="!guest.isSavedCredential">
                <div class="mt-2">
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
                <div class="mb-2">
                  <label for="nameInput" class="form-label">Name</label>
                  <input
                    type="text"
                    class="form-control"
                    id="nameInput"
                    v-model="guest.name"
                  />
                </div>
              </template>
              <div class="mb-2">
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
                    reply_to: { name: comment.name, email: comment.email },
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
          <div v-if="comment.replies.length">
            <div v-for="reply in comment.replies" :key="reply.id">
              <div class="card border-2 mb-2 mt-2">
                <div class="card-body">
                  <img
                    style="width: 50px; height: 50px"
                    src="https://www.svgrepo.com/show/77591/user.svg"
                    alt="user"
                  />
                  <h5 class="card-title">{{ reply.name }}</h5>
                  <h6 class="card-subtitle mb-2 text-muted">
                    Replied to
                    {{
                      reply.reply_to.name + " (" + reply.reply_to.email + ")"
                    }}
                  </h6>
                  <p class="card-text">{{ reply.comment }}</p>

                  <!-- Popover in Reply Comment Section-->
                  <a
                    v-if="reply.email != guest.email"
                    class="card-link pointer"
                    :id="'popover-reply-' + reply.id"
                    variant="primary"
                    ><i class="fas fa-reply"></i>&nbsp;Reply</a
                  >
                  <b-popover
                    v-if="reply.email != guest.email"
                    ref="popover"
                    :target="'popover-reply-' + reply.id"
                    placement="bottomright"
                  >
                    <p class="badge badge-secondary py-2 px-2">
                      Reply to {{ reply.name }}
                    </p>
                    <form onsubmit="return false">
                      <template v-if="!guest.isSavedCredential">
                        <div class="mb-2">
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
                        <div class="mb-2">
                          <label for="nameInput" class="form-label">Name</label>
                          <input
                            type="text"
                            class="form-control"
                            id="nameInput"
                            v-model="guest.name"
                          />
                        </div>
                      </template>
                      <div class="mb-2">
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
                            reply_to: { name: reply.name, email: reply.email },
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

    <div v-if="!post_comments.length">
      <center><h4>Be the first comment :(</h4></center>
    </div>

    <!-- Write Post Comment -->
    <div style="background: rgb(239 239 239)" class="mt-3 py-4 px-4 rounded">
      <form onsubmit="return false">
        <template v-if="!guest.isSavedCredential">
          <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label"
              >Email address</label
            >
            <input
              type="email"
              class="form-control"
              id="exampleInputEmail1"
              aria-describedby="emailHelp"
              v-model="guest.email"
              required
            />
          </div>
          <div class="mb-3">
            <label for="nameInput" class="form-label">Name</label>
            <input
              type="text"
              class="form-control"
              id="nameInput"
              v-model="guest.name"
              required
            />
          </div>
        </template>
        <div class="mb-3">
          <label for="commentInput" class="form-label">Your Comment</label>
          <textarea
            class="form-control"
            ref="write_comment"
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
        <button @click="postComment" class="btn btn-primary">
          Post Comment
        </button>

        <button @click="getCommentsReplies" class="btn btn-primary">
          wwww
        </button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "CommentReplyComponent",

  props: {
    post_id: "",
    post_slug: "",
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
        // {
        //   id: 123,
        //   post_id: this.post_id,
        //   name: "Septian",
        //   email: "septian@mail.com",
        //   comment: "Great content!",
        //   replies: [
        //     {
        //       id: 111,
        //       comment_section_id: 123,
        //       name: "iyan",
        //       email: "iyan@mail.com",
        //       comment: "i know right",
        //       reply_to: { name: "Septian", email: "septian@mail.com" },
        //     },
        //     {
        //       id: 222,
        //       comment_section_id: 123,
        //       name: "brando",
        //       email: "brando@mail.com",
        //       comment: "yyyy",
        //       reply_to: { name: "iyan", email: "iyan@mail.com" },
        //     },
        //   ],
        // },
        // {
        //   id: 456,
        //   post_id: this.post_id,
        //   name: "Mamank Garok",
        //   email: "garok@mail.com",
        //   comment: "Thx!",
        //   replies: [],
        // },
      ],
    };
  },

  async created() {
    await Promise.all([this.getCommentsReplies()]);

    const savedCredential = localStorage.getItem("ayocode_saved_credential");
    if (savedCredential) {
      const {
        guest: { name, email },
      } = JSON.parse(savedCredential);

      this.guest.name = name;
      this.guest.email = email;

      this.guest.isSavedCredential = true;
    } else {
      this.guest.isSavedCredential = false;
    }
  },

  methods: {
    postComment: function () {
      if (this.guest.comment) {
        //PostComment Object Structure
        const postCommentObj = {
          id: Math.floor(Math.random() * 999),
          post_id: this.post_id,
          name: this.guest.name,
          email: this.guest.email,
          comment: this.guest.comment,
          replies: [],
        };

        //Save comment onto the server and push the object into array
        //with given id
        this.request()
          .post("api/posts/comment", postCommentObj)
          .then(({ data }) => {
            this.post_comments.push({ ...postCommentObj, id: data.id });

            //Empty textarea after postComment clicked
            this.guest.comment = "";
          })
          .catch((err) => console.log(err));
      }
    },

    postReplyComment: function ({ reply_to, comment_section_id }) {
      const selectedComment = this.post_comments.find(
        ({ id }) => id == comment_section_id
      );

      if (this.guest.reply) {
        //Reply Object Structure
        const commentReplyObj = {
          id: Math.floor(Math.random() * 999),
          comment_section_id: comment_section_id,
          name: this.guest.name,
          email: this.guest.email,
          comment: this.guest.reply,
          reply_to: reply_to,
        };

        this.request()
          .post("api/posts/reply", {
            ...commentReplyObj,
            reply_to: JSON.stringify(reply_to), //replace reply_to with json string format,
          })
          .then(({ data }) => {
            selectedComment.replies.push({ ...commentReplyObj, id: data.id });
            this.guest.reply = "";
          })
          .catch((err) => {
            console.log(err);
          });
      }
    },

    getCommentsReplies: function () {
      this.request()
        .get("api/posts/discussion?post_id=" + this.post_id)
        .then(({ data }) => {
          data.forEach((element) => {
            element.replies.map((reply, i) => {
              return (reply.reply_to = JSON.parse(reply.reply_to));
            });
          });

          // console.log(data);
          this.post_comments.push(...data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    check: function (e) {
      this.$nextTick(() => {
        if (this.guest.isSavedCredential) {
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
            this.guest.isSavedCredential = false;
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

button {
  border-radius: 5px;
  color: whitesmoke;
}

a:hover {
  color: rgb(94, 201, 228);
}
</style>