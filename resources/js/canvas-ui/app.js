import NProgress from 'nprogress';
import Router from 'vue-router';
import Vue from 'vue';
import VueMeta from 'vue-meta';
import base from './mixins/base';
import moment from 'moment';
import routes from './routes';
import CKEditor from 'ckeditor4-vue';
import { store } from './store';
import { BPagination } from 'bootstrap-vue';

require('bootstrap');

window.Popper = require('popper.js').default;

Vue.prototype.moment = moment;
Vue.config.productionTip = false;

Vue.component('b-pagination', BPagination);

Vue.mixin(base);

Vue.use(CKEditor);
Vue.use(VueMeta);
Vue.use(Router);

NProgress.configure({
    showSpinner: false,
    easing: 'ease',
    speed: 300,
});

const router = new Router({
    base: 'blog',
    mode: 'history',
    routes,
});

router.beforeEach((to, from, next) => {
    NProgress.start();
    next();
});

new Vue({
    el: '#ui',
    store: store,
    router,
});
