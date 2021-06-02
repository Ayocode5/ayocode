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
          <div class="row mt-0">
            <div>
              <!-- <img
                class="mr-2"
                style="width: 50px; height: 50px"
                src="https://www.svgrepo.com/show/77591/user.svg"
                alt="user"
              /> -->
              <i class="mr-2 profileImage" style="display: inline-block">{{
                profileImageInitial(comment.name)
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
          <div class="row">
            <p class="card-text">
              {{ comment.comment }}
            </p>
            <!-- Popover in Post Comment Section-->
          </div>
          <div class="row">
            <a
              class="card-link badge badge-secondary pointer mt-4 py-1 px-1"
              :id="'popover-post-' + comment.id"
              variant="primary"
              ><i class="fas fa-reply"></i>&nbsp;Reply
            </a>
          </div>
          <b-popover
            ref="popover"
            :target="'popover-post-' + comment.id"
            placement="rightbottom"
          >
            <p class="badge badge-secondary py-2 px-2">
              Reply to {{ comment.name }}
            </p>
            <p
              class="px-2 py-2"
              style="
                background: rgb(226, 226, 226);
                border: none;
                border-left: 2px solid grey;
              "
            >
              {{ comment.comment }}
            </p>

            <p></p>
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
                    reply_to: {
                      name: comment.name,
                      email: comment.email,
                      comment: comment.comment,
                    },
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
              <div class="card border-2 mt-2">
                <div class="card-body">
                  <div class="row">
                    <!-- <img
                      style="width: 50px; height: 50px"
                      src="https://www.svgrepo.com/show/77591/user.svg"
                      alt="user"
                    /> -->
                    <i class="mr-2 profileImage">{{
                      profileImageInitial(reply.name)
                    }}</i>
                    <div class="ml-2">
                      <h5 class="card-title">{{ reply.name }}</h5>
                      <h6
                        v-if="reply.email == reply.reply_to.email"
                        class="card-subtitle mb-2 text-muted"
                      >
                        {{ date(reply.created_at) }}
                      </h6>
                      <h6 v-else class="card-subtitle mb-2 text-muted" style="word-break: break-all;">
                        replied to {{ reply.reply_to.name }} -
                        {{ date(reply.created_at) }}
                      </h6>
                    </div>
                  </div>
                  <div
                    class="row mt-2"
                    style="padding-left: 57px; margin-bottom: -12px"
                  >
                    <p
                      class="px-2 py-1"
                      style="
                        background: rgb(226, 226, 226);
                        border: none;
                        border-left: 2px solid grey;
                      "
                    >
                      {{ reply.reply_to.comment }}
                    </p>
                  </div>
                  <div class="row mt-0 pl-8" style="padding-left: 57px">
                    <p class="card-text">{{ reply.comment }}</p>
                  </div>

                  <!-- Popover Trigger -->
                  <div
                    v-if="reply.email != guest.email"
                    class="row mt-4"
                    style="padding-left: 57px"
                  >
                    <a
                      class="card-link pointer badge badge-secondary py-1 px-1"
                      :id="'popover-reply-' + reply.id"
                      variant="primary"
                      ><i class="fas fa-reply"></i>&nbsp;Reply</a
                    >
                  </div>

                  <!-- Popover in Reply Comment Section-->
                  <b-popover
                    v-if="reply.email != guest.email"
                    ref="popover"
                    :target="'popover-reply-' + reply.id"
                    placement="bottomright"
                  >
                    <p class="badge badge-secondary py-2 px-2">
                      Reply to {{ reply.name }}
                    </p>
                    <p
                      class="px-2 py-2"
                      style="
                        background: rgb(226, 226, 226);
                        border: none;
                        border-left: 2px solid grey;
                        height: 120px;
                        overflow: auto;
                      "
                    >
                      {{ reply.comment }}
                    </p>

                    <p></p>
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
      <div class="my-5">
        <p class="lead text-center text-muted mt-5">Be the first comment :(</p>
      </div>
    </div>

    <!-- Write Post Comment -->
    <div style="background: rgb(239 239 239)" class="mt-1 py-3 px-3 rounded">
      <form onsubmit="return false">
        <template v-if="!guest.isSavedCredential">
          <div class="mb-3">
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
    await Promise.all([this.fetchPostDiscussions()]);

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
            this.post_comments.push({
              ...postCommentObj,
              id: data.id,
              created_at: data.created_at,
            });

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
            selectedComment.replies.push({
              ...commentReplyObj,
              id: data.id,
              created_at: data.created_at,
            });
            this.guest.reply = "";
          })
          .catch((err) => {
            console.log(err);
          });
      }
    },

    fetchPostDiscussions: function () {
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

    date: function (date) {
      let months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "Mei",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];
      var dateObj = new Date(date);
      var month = months[dateObj.getMonth()]; //months from 1-12
      var day = dateObj.getDate();
      var year = dateObj.getFullYear();

      return month + " " + day + ", " + year;
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

    profileImageInitial: function (name) {
      const intials = name
        .split(" ")
        .map((name) => name[0])
        .join("")
        .toUpperCase();
      return intials;
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

/* a:hover {
  color: rgb(94, 201, 228);
} */

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
  background: #ee9090;
  font-size: 30px;
  color: #fff;
  text-align: center;
}
</style>