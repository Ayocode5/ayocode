<template>
    <section>
        <page-header />

        <div v-if="isReady" class="mt-5">
            <div class="col-10 offset-1 col-sm-10 offset-sm-1 col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 mt-3">
                
                <center>
                    <div>
                        <img
                            class="shadow-inner rounded-circle"
                            style="width: 150px"
                            :src="user.avatar || user.default_avatar"
                            :alt="user.name"
                        />
                    </div>
                    <div class="mt-2">
                        <h3 class="my-0">
                            {{ user.name }}
                        </h3>
                        <p v-if="user.summary" class="text-secondary my-1">
                            {{ user.summary }}
                        </p>
                        <p class="text-secondary mt-1 mb-0">
                            <a :href="`mailto:${user.email}`">{{ user.email }}</a>
                        </p>
                    </div>
                </center>

                <main role="main" class="mt-5">
                    <div>
                        <h4 class="my-4 border-bottom mt-5 pb-2">
                            <span class="border-bottom border-dark pb-2">Recent Posts</span>
                        </h4>

                        <div :key="`${index}-${post.id}`" v-for="(post, index) in posts">
                            <router-link
                                :to="{ name: 'show-post', params: { slug: post.slug } }"
                                class="text-decoration-none"
                            >
                                <div class="card mb-2">
                                    <div class="card-body px-0">
                                        <div class="container d-lg-inline-flex align-items-center">
                                            <div v-if="post.featured_image" class="col-12 col-lg-3 p-0">
                                                <img
                                                    :src="post.featured_image"
                                                    :alt="post.featured_image_caption"
                                                    class="rounded w-100"
                                                />
                                            </div>
                                            <section
                                                class="col-12 mt-3 mt-lg-0 px-0 px-lg-3"
                                                :class="post.featured_image ? 'col-lg-9' : ''"
                                            >
                                                <h5 class="card-title text-truncate mb-0">{{ post.title }}</h5>
                                                <p class="card-text text-truncate">{{ post.summary }}</p>
                                                <p class="card-text mb-0 text-secondary">
                                                    {{ post.name }}
                                                    <span v-if="post.topic.length"> in {{ post.topic[0].name }} </span>
                                                </p>
                                                <p class="card-text text-secondary">
                                                    {{ moment(post.published_at).format('MMM D, Y') }} —
                                                    {{ post.read_time }}
                                                </p>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </router-link>
                        </div>

                        <infinite-loading spinner="spiral" @infinite="fetchPosts">
                            <span slot="no-more" />
                            <div slot="no-results" class="text-left">
                                <div class="my-5">
                                    <p class="lead text-center text-muted mt-5">You have no published posts</p>
                                    <p class="lead text-center text-muted mt-1">
                                        Write on the go with our mobile-ready app!
                                    </p>
                                </div>
                            </div>
                        </infinite-loading>
                    </div>
                </main>
            </div>
        </div>
    </section>
</template>

<script>
import InfiniteLoading from 'vue-infinite-loading';
import NProgress from 'nprogress';
import PageHeader from '../components/PageHeaderComponent';
import isEmpty from 'lodash/isEmpty';

export default {
    name: 'show-user',

    components: {
        InfiniteLoading,
        PageHeader,
    },

    metaInfo() {
        return {
            title: this.user ? this.user.name : 'ayocode | users',
        };
    },

    data() {
        return {
            uri: this.$route.params.id,
            user: null,
            posts: [],
            page: 1,
            isReady: false,
        };
    },

    async created() {
        await Promise.all([this.fetchUser(), this.fetchPosts()]);
        this.isReady = true;
        NProgress.done();
    },

    methods: {
        fetchUser() {
            return this.request()
                .get(`/api/users/${this.uri}`)
                .then(({ data }) => {
                    this.user = data;
                    NProgress.inc();
                })
                .catch(() => {
                    NProgress.done();
                });
        },

        fetchPosts($state) {
            if ($state) {
                return this.request()
                    .get(`/api/users/${this.uri}/posts`, {
                        params: {
                            page: this.page,
                        },
                    })
                    .then(({ data }) => {
                        if (!isEmpty(data) && !isEmpty(data.data)) {
                            this.page += 1;
                            this.posts.push(...data.data);

                            console.log(data)

                            $state.loaded();
                        } else {
                            $state.complete();
                        }

                        if (isEmpty($state)) {
                            NProgress.inc();
                        }
                    })
                    .catch(() => {
                        NProgress.done();
                    });
            }
        },
    },
};
</script>
