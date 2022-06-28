<template>
  <div>
     <!-- Navigation V2 -->
      <nav
        id="navbar"
        class="navbar navbar-expand-lg navbar-light border-bottom p-4 w-100"
      >
        <div class="container-fluid">
          <img
            src="/storage/images/content/logo.png"
            class="navbar-brand p-0"
            width="50"
            height="50"
            alt="agency-icon"
          />
          <router-link
            class="navbar-brand"
            style="font-family: 'Acme', sans-serif"
            :to="{name: 'posts'}"
            >Blogs</router-link
          >
          <button
            class="navbar-toggler border-0"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <router-link 
                  class="nav-link" :class="{ active: $route.path == '/tags' }"
                  :to="{name: 'tags'}">
                    Tags
                </router-link>
              </li>
              <li class="nav-item">
                <router-link 
                  class="nav-link" 
                  :class="{ active: $route.path == '/topics' }"
                  :to="{name: 'topics'}">
                    Topics
                </router-link>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" tabindex="-1" aria-disabled="true"
                  >Portfolio</a
                >
              </li>
            </ul>

            <!-- Search Input -->
            <label class="sr-only" for="inlineFormInputGroup">Search</label>
            
            <div class="float-right px-2 ml-auto">
              <input
                v-on:keyup.enter="searchPost()"
                v-model="keyword"
                type="text"
                class="col"
                id="inlineFormInputGroup"
                placeholder="Search"
              />
            <!-- <i v-on:click="searchPost()" class="col-1 fas fa-search text-secondary" style=""></i> -->
            </div>
          </div>

        </div>
      </nav>

    <!-- CANVAS DEFAULT NAVBAR -->
    <!-- <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-12"> -->
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
    <!-- </div> -->
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

      path: this.$route.path,
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