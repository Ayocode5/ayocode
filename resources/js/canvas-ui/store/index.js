import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
     relatedPostLoaded: true,
  },

  mutations: {
    relatedPostLoaded (state, bool) {
      state.relatedPostLoaded = bool;
    }
  },

  getters: {
    getRelatedPostLoaded(state) {
        return state.relatedPostLoaded;
    }
  }
})
