<template>
  <div class="shadow-sm navigation">
    <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12">
      <!-- <nav class="navbar d-flex px-0 py-1">
        <router-link
          :to="{ name: 'posts' }"
          class="navbar-brand hover font-weight-bolder mr-3"
        >
          <div class="pl-4 flex items-center">
            <img
              style="height: 45px"
              src="/storage/images/content/logo.png"
              alt="ayocode logo"
            />
            Blogs
          </div>
        </router-link>
        <div class="mr-auto border-left pl-1">
          <router-link
            :to="{ name: 'tags' }"
            class="btn btn-link py-0 text-decoration-none"
          >
            Tags
          </router-link>
          <router-link
            :to="{ name: 'topics' }"
            class="btn btn-link py-0 text-decoration-none"
          >
            Topics
          </router-link>
        </div>

        <div class="form-row align-items-center">
          <label class="sr-only" for="inlineFormInputGroup">Search</label>
          <div class="input-group mb-2 mt-2">
            <input
              v-on:keyup.enter="searchPost()"
              v-model="keyword"
              type="text"
              class=""
              id="inlineFormInputGroup"
              placeholder="Search"
            />
            <div v-on:click="searchPost()" class="input-group-prepend">
              <div class="input-group-text"><i class="fas fa-search"></i></div>
            </div>
          </div>
        </div>

        <slot v-if="user" name="options" />
        
                <div v-if="user" class="dropdown ml-3">
                    <a
                        id="navbarDropdown"
                        href="#"
                        class="nav-link px-0 text-secondary"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                    >
                        <img
                            :src="user.avatar || user.default_avatar"
                            :alt="user.name"
                            class="rounded-circle my-0 shadow-inner"
                            style="width: 33px"
                        />
                    </a>
                    
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <h6 class="dropdown-header">
                            <strong>{{ user.name }}</strong>
                            <br />
                            {{ user.email }}
                        </h6>
                        <div class="dropdown-divider" />
                        <a :href="`/${canvasPath}/users/${user.id}/edit`" class="dropdown-item">Your profile</a>
                        <a :href="`/${canvasPath}/posts`" class="dropdown-item">Posts</a>
                        <a v-if="isAdmin" :href="`/${canvasPath}/users`" class="dropdown-item">Users</a>
                        <a v-if="isAdmin" :href="`/${canvasPath}/tags`" class="dropdown-item">Tags</a>
                        <a v-if="isAdmin" :href="`/${canvasPath}/topics`" class="dropdown-item">Topics</a>
                        <a :href="`/${canvasPath}/stats`" class="dropdown-item">Stats</a>
                        <div class="dropdown-divider" />
                        <a :href="`/${canvasPath}/settings`" class="dropdown-item">Settings</a>
                        <a href="" class="dropdown-item" @click.prevent="logout"> Sign out </a>
                    </div>
                </div>

                <a v-if="!user" :href="`/${canvasPath}/login`" class="btn btn-link text-decoration-none">Sign in</a>
      </nav> -->

      <nav class="navbar navbar-expand-lg navbar-light">
        <router-link
          :to="{ name: 'posts' }"
          class="navbar-brand hover font-weight-bolder mr-3"
        >
          <div class="flex items-center">
            <img
              style="height: 45px"
              src="/storage/images/content/logo.png"
              alt="ayocode logo"
            />
            AYOCODE
          </div>
        </router-link>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarText"
          aria-controls="navbarText"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- <div class="mr-auto border-left pl-1"></div> -->
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item " :class="{ active: $route.path == '/tags' }">
              <router-link
                :to="{ name: 'tags' }"
                class="nav-link py-0 text-decoration-none"
              >
                Tags
              </router-link>
            </li>
            <li class="nav-item " :class="{ active: $route.path == '/topics' }">
              <router-link
                :to="{ name: 'topics' }"
                class="nav-link py-0 text-decoration-none"
              >
                Topics
              </router-link>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="#">Pricing</a>
            </li> -->
          </ul>
          <div class="align-items-center">
          <label class="sr-only" for="inlineFormInputGroup">Search</label>
          <div class="input-group mb-2 mt-2">
            <input
              v-on:keyup.enter="searchPost()"
              v-model="keyword"
              type="text"
              class=""
              id="inlineFormInputGroup"
              placeholder="Search"
            />
            <div v-on:click="searchPost()" class="input-group-prepend">
              <div class="input-group-text"><i class="fas fa-search"></i></div>
            </div>
          </div>
        </div>
        </div>
      </nav>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "page-header-component",

  data() {
    return {
      user: CanvasUI.user, // eslint-disable-line no-undef
      canvasPath: CanvasUI.canvasPath, // eslint-disable-line no-undef

      keyword: this.$route.params.keyword ?? null,

      path: this.$route.path
    };
  },

  created() {
    // console.log(this.$route.path)
  },

  methods: {
    logout() {
      axios.get(`/${this.canvasPath}/logout`).then(() => {
        window.location.href = `/${this.canvasPath}/login`;
      });
    },

    searchPost() {
      if (this.keyword) {
        this.$router
          .push({ name: "search-post", params: { keyword: this.keyword } })
          .catch({});
      }
    },
  },
};
</script>
<style scoped>
.navigation {
  background: rgb(251,251,251);
background: linear-gradient(90deg, rgba(251,251,251,1) 0%, rgba(247,247,247,1) 50%, rgba(242,242,242,1) 100%);
}

input {
  border: none;
  background: transparent;
  border-bottom: 2px solid #e9e9e9;
  border-radius: 0px;
  color: #8b8b8b;
  padding: 5px 10px;
  outline: none;
  padding-left: 2px;
}

input:focus {
  background: transparent;
}

[placeholder]:focus::-webkit-input-placeholder {
  transition: text-indent 0.4s 0.4s ease;
  text-indent: -100%;
  opacity: 1;
  color: rgb(207, 206, 206);
}

.input-group-text {
  background: transparent;
  border: none;
  border-bottom: 2px solid #e9e9e9;
  border-radius: 0px;
  color: #adadad;
}
</style>