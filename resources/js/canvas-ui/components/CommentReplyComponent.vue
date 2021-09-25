<template>
  <div
    class="
      col-10
      offset-1
      col-xl-8
      offset-xl-2
      col-lg-8
      offset-lg-2
      col-md-10
      offset-md-1
      col-sm-10
      offset-sm-1
      mt-5
    "
  >
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
          <div class="row row-cols-auto mt-0 px-0">
            <img
              class=""
              style="width: 50px; height: 50px; border-radius: 50%"
              :src="comment.avatar"
              alt="guests"
            />
            <div class="col offset-0">
              <h5 class="card-title">{{ comment.name }}</h5>
              <h6 class="card-subtitle mb-2 text-muted">
                <!-- Commented on {{ post_slug }} -->
                {{ date(comment.created_at) }}
              </h6>
            </div>
          </div>
          <!-- End of Guest Short Information -->

          <!-- Guest Comments -->
          <div class="row mt-1">
            <p class="col card-text">
              <span v-html="comment.comment"></span>
            </p>
          </div>

          <!-- Reply Button -->
          <div class="row">
            <a
              class="
                card-link
                input-box
                disable-select
                pointer
                mt-4
                py-1
                px-1
                ml-2
              "
              variant="primary"
              data-toggle="collapse"
              :href="'#reply-input-' + comment.id"
              role="button"
              aria-expanded="false"
              :aria-controls="'reply-input-' + comment.id"
              ><i class="fas fa-reply"></i>&nbsp;Reply
            </a>
            <a
              v-if="comment.total_replies || comment.replies.length > 0"
              class="
                card-link
                load-replies
                disable-select
                pointer
                mt-4
                py-1
                px-1
              "
              data-toggle="collapse"
              variant="primary"
              :href="'#reply-section-' + comment.id"
              role="button"
              aria-expanded="true"
              :aria-controls="'reply-section-' + comment.id"
              @click="fetchPostReplies(comment.id)"
              ><i
                :ref="'total-replies' + comment.id"
                class="fas fa-angle-right mr-1"
              ></i
              >&nbsp;
              {{
                comment.replies.length > 0
                  ? comment.replies.length
                  : comment.total_replies
              }}
              Replies
            </a>
            <!-- <a class="card-link badge badge-primary disable-select pointer ml-2" @click="fetchPostReplies(comment.id)">Load All Replies</a> -->
          </div>
          <!-- End of Reply Button -->

          <!-- Reply InputBox -->
          <div class="mt-2 collapse" :id="'reply-input-' + comment.id">
            <form onsubmit="return false">
              <template v-if="!guest.isSaved">
                <div class="row">
                  <div class="col">
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
                  <div class="col">
                    <label for="nameInput" class="form-label">Name</label>
                    <input
                      type="text"
                      class="form-control"
                      id="nameInput"
                      v-model="guest.name"
                    />
                  </div>
                </div>
              </template>

              <div class="mt-2 mb-2">
                <label for="commentInput" class="form-label"
                  >Reply to
                  <span class="text-primary"
                    ><strong>@{{ comment.name }}</strong></span
                  ></label
                >
                <ckeditor
                  :config="editorConfig"
                  v-model="guest.reply"
                ></ckeditor>
              </div>

              <!-- Save Guest Information -->
              <!-- <div class="mb-3 form-check">
                <input
                  type="checkbox"
                  class="form-check-input"
                  :id="'InputCheck2'+comment.id"
                  v-model="guest.isSaved"
                  @change="check"
                />
                <label class="form-check-label" :for="'InputCheck2'+comment.id"
                  >Save my name and email</label
                >
              </div> -->

              <!-- Post Reply Button -->
              <button
                @click="
                  postReply(
                    {
                      reply_target: {
                        name: comment.name,
                        email: comment.email,
                        comment: comment.comment,
                      },
                      parent_id: comment.id,
                    },
                    `replyInputBox${comment.id}`
                  )
                "
                class="btn btn-secondary"
              >
                Post Reply
              </button>
            </form>
          </div>
          <!-- End of Reply InputBox -->

          <!-- Comment Replies Section -->
          <div class="collapse" :id="'reply-section-' + comment.id">
            <div v-if="comment.replies.length > 0">
              <div v-for="reply in comment.replies" :key="reply.id">
                <div class="card border-2 mt-2" style="padding-left: 10px">
                  <div class="card-body">
                    <!-- Guest -->
                    <div class="row">
                      <!-- Guest Alias -->
                      <img
                        class=""
                        style="height: 50px; width: 50px; border-radius: 50%"
                        :src="reply.avatar"
                        alt="user"
                      />

                      <!-- Guest Short Info -->
                      <div class="col ml-2">
                        <h5 class="card-title">{{ reply.name }}</h5>
                        <h6
                          v-if="reply.email == reply.reply_target.email"
                          class="card-subtitle mb-2 text-muted"
                        >
                          {{ date(reply.created_at) }}
                        </h6>
                        <h6
                          v-else
                          class="card-subtitle mb-2 text-muted"
                          style="word-break: keep-all"
                        >
                          replied to
                          <span class="text-primary"
                            ><strong
                              >@{{ reply.reply_target.name }}</strong
                            ></span
                          >
                          -
                          {{ date(reply.created_at) }}
                        </h6>
                      </div>
                    </div>

                    <!-- Reply Target Message -->
                    <div class="row mt-2 ml-1">
                      <p
                        class="px-2 py-1"
                        style="
                          background: rgb(226, 226, 226);
                          border: none;
                          border-left: 2px solid grey;
                          border-radius: 3px;
                          width: auto;
                          word-wrap: normal;
                        "
                      >
                        <span v-html="reply.reply_target.comment"></span>
                      </p>
                    </div>
                    <!-- End of Reply Target Message -->

                    <!-- Reply Message -->
                    <div class="row mt-1 ml-1 pl-8">
                      <p class="card-text">
                        <span v-html="reply.comment"></span>
                      </p>
                    </div>
                    <!-- End of Reply Message -->

                    <!-- Reply Button Trigger -->
                    <div v-if="reply.email != guest.email" class="mt-3">
                      <a
                        class="card-link disable-select pointer py-1 px-1"
                        variant="primary"
                        data-toggle="collapse"
                        :href="'#reply-input-' + reply.id"
                        role="button"
                        aria-expanded="false"
                        :aria-controls="'reply-input-' + reply.id"
                        ><i class="fas fa-reply"></i>&nbsp;Reply</a
                      >
                    </div>
                    <!-- End of Reply Button Trigger -->

                    <!-- Reply InputBox in Replies Section -->
                    <div
                      class="mt-2 collapse"
                      :id="'reply-input-' + reply.id"
                      style="margin-left: 3px"
                    >
                      <form onsubmit="return false">
                        <template v-if="!guest.isSaved">
                          <div class="row mt-2 mb-2">
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
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
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                              <label for="nameInput" class="form-label"
                                >Name</label
                              >
                              <input
                                type="text"
                                class="form-control"
                                id="nameInput"
                                v-model="guest.name"
                              />
                            </div>
                          </div>
                        </template>
                        <div class="mb-2">
                          <label for="commentInput" class="form-label"
                            >Reply to
                            <span class="text-primary"
                              ><strong>@{{ reply.name }}</strong></span
                            ></label
                          >
                          <ckeditor
                            :config="editorConfig"
                            v-model="guest.reply"
                          ></ckeditor>
                        </div>
                        <!-- <div class="mb-3 form-check">
                        <input
                          type="checkbox"
                          class="form-check-input"
                          :id="'inputCheck'+reply.id"
                          v-model="guest.isSaved"
                          @change="check"
                        />
                        <label class="form-check-label" :for="'inputCheck'+reply.id"
                          >Save my name and email</label
                        >
                      </div> -->
                        <button
                          @click="
                            postReply({
                              reply_target: {
                                name: reply.name,
                                email: reply.email,
                                comment: reply.comment,
                              },
                              parent_id: comment.id,
                            })
                          "
                          class="btn btn-secondary"
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
      class="btn btn-secondary mt-2"
      @click="fetchPostComments()"
      style="width: 100%"
    >
      <i class="fas fa-comment"></i> Load more comments
    </button>

    <!-- Write Post Comment -->
    <div class="mt-2">
      <form onsubmit="return false">
        <template v-if="!guest.isSaved">
          <div class="mb-3">
            <div class="row">
              <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <div class="mb-3">
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
              </div>
              <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
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
          <ckeditor :config="editorConfig" v-model="guest.comment"></ckeditor>
        </div>
        <div class="mb-3 form-check">
          <input
            type="checkbox"
            class="form-check-input"
            v-model="guest.isSaved"
            id="exampleCheck1"
            @change="check"
          />
          <label class="form-check-label" for="exampleCheck1"
            >Save my name and email for the next time i comment</label
          >
        </div>
        <button @click="postComment" class="btn btn-secondary">
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
        name: "",
        email: "",
        comment: "",
        reply: "",
        isSaved: false,
      },

      editorConfig: {
        toolbar: [
          [
            "Bold",
            "Italic",
            "Underline",
            "Strike",
            "TextColor",
            "-",
            "NumberedList",
            "BulletedList",
            "-",
            "Link",
            "Unlink",
          ],
        ],
      },

      state: {
        can_reload_comments: false,
        post_comment_page: 1,
      },

      loaded_replies: [],

      post_comments: [
        // COMMENT DATA STRUCTURE DESIGN ( Sorry if its not good enough )
        // {
        //   id: 456,
        //   post_id: this.post_id,
        //   post_slug: this.post_slug,
        //   name: "Mamank Garok",
        //   email: "garok@mail.com",
        //   avatar: "http://get.avatar.com/avatar.jpg",
        //   comment: "Post Comment",
        //   replies: [
        //     {
        //        id: 459,
        //        post_id: this.post_id,
        //        post_slug: this.post_slug,
        //        parent_id: 456,
        //        name: "Mamank Garok",
        //        email: "garok@mail.com",
        //        avatar: "http://get.avatar.com/avatar.jpg",
        //        comment: "Reply Comment",
        //        reply_target: {"name":"Mamank Garok","email":"garok@mail.com","comment":"Post Comment"},
        //        created_at: '2021-07-06 22:57:06'
        //        deleted_at: undefined,
        //     },
        //  ],
        //  created_at: '2021-07-06 22:57:06'
        //  deleted_at: undefined,
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

      this.guest.isSaved = true;
    } else {
      this.guest.isSaved = false;
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
          avatar: null,
          comment: this.guest.comment,
          replies: [],
          created_at: null,
        };

        //Save comment onto the server and push the object into array
        //with the given id
        await this.request()
          .post("api/posts/comment", PostCommentObj)
          .then(({ data }) => {
            // console.log(data);
            this.post_comments.unshift({
              ...PostCommentObj,
              id: data.id,
              avatar: data.avatar,
              created_at: data.created_at,
            });

            //Empty textarea after postComment successfully posted
            this.guest.comment = "";
          })
          .catch((err) => console.log(err));
      }
    },

    postReply: async function ({ reply_target, parent_id }) {
      const selectedComment = this.post_comments.find(
        ({ id }) => id == parent_id
      );

      if (this.guest.reply) {
        //Reply Object Structure
        const PostReplyObj = {
          id: Math.floor(Math.random() * 999),
          post_id: this.post_id,
          post_slug: this.post_slug,
          parent_id: parent_id,
          name: this.guest.name,
          email: this.guest.email,
          avatar: null,
          comment: this.guest.reply,
          reply_target: reply_target,
          created_at: null,
        };

        await this.request()
          .post("api/posts/reply", {
            ...PostReplyObj,
            reply_target: JSON.stringify(reply_target), //stringify the reply target into string format,
          })
          .then(({ data }) => {
            // console.log(selectedComment);
            // console.log('REPLIES', data);
            selectedComment.replies.push({
              ...PostReplyObj,
              id: data.id,
              avatar: data.avatar,
              created_at: data.created_at,
              deleted_at: data.deleted_at,
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
      this.request()
        .get(`api/posts/comment`, {
          params: {
            page: this.state.post_comment_page,
            post_slug: this.post_slug,
            limit: 5,
          },
        })
        .then(({ data }) => {
          //determine if user still can reload more comments
          data.next_page_url
            ? (this.state.can_reload_comments = true)
            : (this.state.can_reload_comments = false);

          //create 'replies' property in each comment object with an empty array
          data.data.map((val) => (val.replies = []));

          //avoid element that already pushed being pushed twice
          data.data.forEach((element) => {
            const post = this.post_comments.find((el) => el.id == element.id);
            if (post == undefined) {
              this.post_comments.push(element);
            }
          });

          this.state.post_comment_page += 1;
        })
        .catch((err) => {
          console.log(err);
        });
    },

    fetchPostReplies: async function (comment_id) {
      if (!this.loaded_replies.includes(comment_id)) {
        await this.request()
          .get(`api/posts/reply`, {
            params: {
              parent_id: comment_id,
            },
          })
          .then(({ data }) => {
            //find a comment by id
            const selectedComment = this.post_comments.find(
              (comment) => comment.id == comment_id
            );

            //parsing json string
            data.map(
              (val) => (val.reply_target = JSON.parse(val.reply_target))
            );

            //repush replies
            selectedComment.replies = [];
            selectedComment.replies.push(...data);

            this.loaded_replies.push(comment_id);
          })
          .catch((err) => console.log(err));
      }
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
        if (this.guest.isSaved) {
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
            // console.log("email and name required before you can save it");
            alert('"email and name required!');
            this.guest.isSaved = false;
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
  /* color: whitesmoke; */
}

.btn-post-comment {
  border: 2px solid #1a202c;
}

.card {
  border: none;
  border-radius: 0px;
  transition: none;
  box-shadow: none;
}

.card-link {
  text-decoration: none;
  color: rgb(22, 22, 22);
}

.card-link:hover {
  color: rgb(85, 85, 85);
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

.btn-secondary {
  background: rgb(251, 251, 251);
  background: linear-gradient(
    90deg,
    rgba(251, 251, 251, 1) 0%,
    rgba(247, 247, 247, 1) 50%,
    rgba(242, 242, 242, 1) 100%
  );
  color: rgb(53, 53, 53);
  border: none;
}

.btn-secondary:hover {
  background-color: #878787;
  /* color: rgb(53, 53, 53);
  border: none; */
}
</style>