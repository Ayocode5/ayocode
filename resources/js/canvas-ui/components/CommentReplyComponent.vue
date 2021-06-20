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
        class="card card-comment"
      >
        <div class="card-body">
          <!-- Guest Short Information -->
          <div class="row mt-0">
            <div>
              <!-- <img
                class="mr-2"
                style="width: 50px; height: 50px"
                src="https://www.svgrepo.com/show/77591/user.svg"
                alt="user"
              /> -->
              <i class="mr-2 profileImage" style="display: inline-block">{{
                getInitialName(comment.name)
              }}</i>
            </div>
            <div>
              <h5 class="card-title">{{ comment.name }}</h5>
              <h6 class="card-subtitle mb-2 text-muted">
                <!-- Commented on {{ post_slug }} -->
                {{ date(comment.created_at) }}
              </h6>
            </div>
          </div>
          <!-- End of Guest Short Information -->

          <!-- Guest Comments -->
          <div class="row">
            <p class="card-text" style="padding-left: 59px">
              <span v-html="comment.comment"></span>
            </p>
          </div>

          <!-- Reply Button -->
          <div class="row" style="padding-left: 59px">
            <a
              class="
                card-link
                disable-select
                badge badge-secondary
                pointer
                mt-4
                py-1
                px-1
              "
              variant="primary"
              data-toggle="collapse"
              :href="'#reply-input-' + comment.id"
              role="button"
              aria-expanded="true"
              :aria-controls="'reply-input-' + comment.id"
              ><i class="fas fa-reply"></i>&nbsp;Reply
            </a>
            <a
              v-if="comment.total_replies > 0"
              class="
                card-link
                disable-select
                badge badge-secondary
                pointer
                mt-4
                py-1
                px-1
              "
              @click="fetchPostReplies(comment.id)"
              ><i class="fas fa-comment"></i>&nbsp;All Replies
            </a>
            <!-- <a class="card-link badge badge-primary disable-select pointer ml-2" @click="fetchPostReplies(comment.id)">Load All Replies</a> -->
          </div>
          <!-- End of Reply Button -->

          <!-- Reply InputBox -->
          <div
            class="mt-2 collapse"
            :id="'reply-input-' + comment.id"
            style="margin-left: 45px"
          >
            <form
              onsubmit="return false"
              class="py-3 px-3 rounded"
              style="background: rgb(239 239 239)"
            >
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
                <label for="commentInput" class="form-label"
                  >Reply to {{ comment.name }}</label
                >
                <ckeditor v-model="guest.reply"></ckeditor>
              </div>

              <!-- Save Guest Information -->
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

              <!-- Post Reply Button -->
              <button
                @click="
                  postReply(
                    {
                      reply_to: {
                        name: comment.name,
                        email: comment.email,
                        comment: comment.comment,
                      },
                      comment_section_id: comment.id,
                    },
                    `replyInputBox${comment.id}`
                  )
                "
                class="btn btn-primary"
              >
                Post Reply
              </button>
            </form>
          </div>
          <!-- End of Reply InputBox -->

          <!-- Comment Replies Section -->
          <div v-if="comment.replies.length">
            <div v-for="reply in comment.replies" :key="reply.id">
              <div class="card border-2 mt-2" style="padding-left: 40px">
                <div class="card-body">
                  <!-- Guest -->
                  <div class="row">
                    <!-- Guest Alias -->
                    <i class="mr-2 profileImage">{{
                      getInitialName(reply.name)
                    }}</i>

                    <!-- Guest Short Info -->
                    <div class="ml-2">
                      <h5 class="card-title">{{ reply.name }}</h5>
                      <h6
                        v-if="reply.email == reply.reply_to.email"
                        class="card-subtitle mb-2 text-muted"
                      >
                        {{ date(reply.created_at) }}
                      </h6>
                      <h6
                        v-else
                        class="card-subtitle mb-2 text-muted"
                        style="word-break: keep-all"
                      >
                        replied to {{ reply.reply_to.name }} -
                        {{ date(reply.created_at) }}
                      </h6>
                    </div>
                  </div>

                  <!-- Reply Target Message -->
                  <div
                    class="row mt-2"
                    style="padding-left: 65px; margin-bottom: -12px"
                  >
                    <p
                      class="px-2 py-1"
                      style="
                        background: rgb(226, 226, 226);
                        border: none;
                        border-left: 2px solid grey;
                        border-radius: 3px;
                        display: inline;
                      "
                    >
                      <span v-html="reply.reply_to.comment"></span>
                    </p>
                  </div>
                  <!-- End of Reply Target Message -->

                  <!-- Reply Message -->
                  <div class="row mt-0 pl-8" style="padding-left: 65px">
                    <p class="card-text">
                      <span v-html="reply.comment"></span>
                    </p>
                  </div>
                  <!-- End of Reply Message -->

                  <!-- Reply Button Trigger -->
                  <div
                    v-if="reply.email != guest.email"
                    class="row mt-4"
                    style="padding-left: 65px"
                  >
                    <a
                      class="
                        card-link
                        disable-select
                        pointer
                        badge badge-secondary
                        py-1
                        px-1
                      "
                      variant="primary"
                      data-toggle="collapse"
                      :href="'#reply-input-' + reply.id"
                      role="button"
                      aria-expanded="true"
                      :aria-controls="'reply-input-' + reply.id"
                      ><i class="fas fa-reply"></i>&nbsp;Reply</a
                    >
                  </div>
                  <!-- End of Reply Button Trigger -->

                  <!-- Reply InputBox in Reply Section -->
                  <div
                    class="mt-2 collapse px-3 py-3 rounded"
                    :id="'reply-input-' + reply.id"
                    style="margin-left: 50px; background: rgb(239, 239, 239)"
                  >
                    <p
                      class="px-2 py-2"
                      style="
                        background: rgb(226, 226, 226);
                        border: none;
                        border-left: 2px solid grey;
                        overflow: auto;
                        border-radius: 3px;
                      "
                    >
                      <span v-html="reply.comment"></span>
                    </p>
                    <!-- End of Reply Target Info -->

                    <form onsubmit="return false">
                      <template v-if="!guest.isSavedCredential">
                        <div class="mb-2">
                          <label for="exampleInputEmail2" class="form-label"
                            >Email address</label
                          >
                          <input
                            type="email"
                            class="form-control"
                            id="exampleInputEmail2"
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
                          >Reply to {{ reply.name }}</label
                        >
                        <ckeditor v-model="guest.reply"></ckeditor>
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
                          postReply({
                            reply_to: {
                              name: reply.name,
                              email: reply.email,
                              comment: reply.comment,
                            },
                            comment_section_id: comment.id,
                          })
                        "
                        class="btn btn-primary"
                      >
                        Post Reply
                      </button>
                    </form>
                  </div>
                  <!-- End of Reply InputBox in Reply Section -->
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
      <div class="my-5">
        <p class="lead text-center text-muted mt-5">Be the first comment :(</p>
      </div>
    </div>

    <button
      v-if="state.can_reload_comments"
      class="btn btn-primary mt-2"
      @click="fetchPostComments()"
      style="width: 100%"
    >
      Load more comments
    </button>

    <!-- Write Post Comment -->
    <div style="background: rgb(239 239 239)" class="mt-2 py-3 px-3 rounded">
      <form onsubmit="return false">
        <template v-if="!guest.isSavedCredential">
          <div class="mb-3">
            <div class="row">
              <div class="col">
                <label for="exampleInputEmail3" class="form-label"
                  >Email address</label
                >
                <input
                  type="email"
                  class="form-control"
                  id="exampleInputEmail3"
                  aria-describedby="emailHelp"
                  v-model="guest.email"
                  required
                />
              </div>
              <div class="col">
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
              </div>
            </div>
          </div>
        </template>
        <div class="mb-3">
          <label for="commentInput" class="form-label"
            >Write Your Comment</label
          >
          <ckeditor v-model="guest.comment"></ckeditor>
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
        <!-- <button @click="getCommentsReplies" class="btn btn-primary">
          wwww
        </button> -->
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
        editorConfig: "standard",
        name: "",
        email: "",
        comment: "",
        reply: "",
        isSavedCredential: false,
      },

      state: {
        can_reload_comments: true,
        post_comment_page: 0,
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
        //       reply_to: { name: "Septian", email: "septian@mail.com", comment: "Great content" },
        //     },
        //     {
        //       id: 222,
        //       comment_section_id: 123,
        //       name: "brando",
        //       email: "brando@mail.com",
        //       comment: "yyyy",
        //       reply_to: { name: "iyan", email: "iyan@mail.com", comment: "i konw right" },
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
    await Promise.all([this.fetchPostComments()]);

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
    postComment: async function () {
      if (this.guest.comment) {
        //PostComment Object Structure
        const PostCommentObj = {
          id: Math.floor(Math.random() * 999),
          post_id: this.post_id,
          post_slug: this.post_slug,
          name: this.guest.name,
          email: this.guest.email,
          comment: this.guest.comment,
          replies: [],
          created_at: null,
        };

        //Save comment onto the server and push the object into array
        //with the given id
        await this.request()
          .post("api/posts/comment", PostCommentObj)
          .then(({ data }) => {
            this.post_comments.unshift({
              ...PostCommentObj,
              id: data.id,
              created_at: data.created_at,
            });

            //Empty textarea after postComment successfully posted
            this.guest.comment = "";
          })
          .catch((err) => console.log(err));
      }
    },

    postReply: async function ({ reply_to, comment_section_id }) {
      const selectedComment = this.post_comments.find(
        ({ id }) => id == comment_section_id
      );

      if (this.guest.reply) {
        //Reply Object Structure
        const PostReplyObj = {
          id: Math.floor(Math.random() * 999),
          post_id: this.post_id,
          post_slug: this.post_slug,
          comment_section_id: comment_section_id,
          name: this.guest.name,
          email: this.guest.email,
          comment: this.guest.reply,
          reply_to: reply_to,
          created_at: null,
        };

        await this.request()
          .post("api/posts/reply", {
            ...PostReplyObj,
            reply_to: JSON.stringify(reply_to), //stringify the reply target into string format,
          })
          .then(({ data }) => {
            selectedComment.replies.push({
              ...PostReplyObj,
              id: data.id,
              created_at: data.created_at,
            });

            //Empty textarea after postReply successfully posted
            this.guest.reply = "";
          })
          .catch((err) => {
            console.log(err);
          });
      }
    },

    fetchPostComments: function () {
      this.state.post_comment_page += 1;

      this.request()
        .get(`api/posts/comment`, {
          params: {
            page: this.state.post_comment_page,
            post_id: this.post_id,
          },
        })
        .then(({ data }) => {
          console.log(data);
          //determine if user still can reload more comments
          data.to == null || data.to < data.per_page ? (this.state.can_reload_comments = false) : "";
          //create 'replies' property in each comment object with an empty array
          data.data.map((val) => (val.replies = []));

          //avoid element that already pushed being pushed twice
          data.data.forEach((element) => {
            const post = this.post_comments.find((el) => el.id == element.id);
            if (post == undefined) {
              this.post_comments.push(element);
            }
          });

          // this.post_comments.push(...data.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    fetchPostReplies: async function (comment_id) {
      await this.request()
        .get(`api/posts/reply`, {
          params: {
            comment_id: comment_id,
          },
        })
        .then(({ data }) => {
          const selectedComment = this.post_comments.find(
            (comment) => comment.id == comment_id
          );
          data.map((val) => (val.reply_to = JSON.parse(val.reply_to)));
          selectedComment.replies = [];
          selectedComment.replies.push(...data);
        })
        .catch((err) => console.log(err));
    },

    date: function (date) {
      return new Date(date)
        .toDateString()
        .split(" ")
        .map((val, index) => {
          if (index == 0) {
            return val + ",";
          }
          return val;
        })
        .join(" ");
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
            console.log("email and name required before you can save it");
            this.guest.isSavedCredential = false;
          }
        } else {
          localStorage.removeItem("ayocode_saved_credential");
        }
      });
    },

    getInitialName: function (name) {
      return name
        .split(" ")
        .map((name) => name[0])
        .join("")
        .toUpperCase();
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

.card {
  border: none;
  border-radius: 0px;
  transition: none;
  box-shadow: none;
}

.card-comment {
  border-bottom: 1px solid rgb(226, 226, 226);
}

.card:hover {
  /*  */
  transition: none;
}

.profileImage {
  font-family: sans-serif;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: #a1a1a1;
  font-size: 30px;
  color: #fff;
  text-align: center;
  user-select: none;
}
</style>