import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"
import { createApp } from 'vue'
import { createStore } from 'vuex'
import './style.css'
import App from './App.vue'

const store = createStore({
  state() {
    return {
      currentPlayer: 'X',
      previousMovement: '',
    }
  },
  mutations: {
    changePlayer (state) {
      if (state.currentPlayer == "X") {
        state.currentPlayer = "O"
        state.previousMovement = ''
      }else{
        state.currentPlayer = "X"
        state.previousMovement = ''
      }
    }
  }
})

const app = createApp(App)
app.use(store)
app.mount('#app')
