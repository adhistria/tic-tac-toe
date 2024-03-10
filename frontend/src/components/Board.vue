<script setup>
import Square from './Square.vue'
</script>

<template>
  <div class="container">
    <div class="alert alert-danger alert-dismissible fade show" role="alert" v-if="showAlert">
      {{errorMessage}}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" @click="closeError"></button>
    </div>

    <div class="alert alert-success alert-dismissible fade show" role="alert" v-if="showSuccessAlert">
      {{successMessage}}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" @click="closeSuccess"></button>
    </div>

    <div class="row mb-5 justify-content-center">
      <div class="row g-5 align-items-center mb-2">
        <div class="col-auto">
          <label for="inputPlayer1Name" class="col-form-label">Player 1 Name:</label>
        </div>
        <div class="col-auto">
          <div v-if="!disableForm">
            <input type="text" id="inputPlayer1Name" class="form-control" v-model="player1Name">
          </div>
          <div v-else>
            {{ player1Name }}
          </div>
        </div>

        <div class="col-auto right-align">
          <label for="inputPlayer2Name" class="col-form-label">Player 2 Name:</label>
        </div>
        <div class="col-auto">
          <div v-if="!disableForm">
            <input type="text" id="inputPlayer2Name" class="form-control" v-model="player2Name" v-if="!disableForm">
          </div>
          <div v-else>
            {{ player2Name }}
          </div>
          
        </div>
      </div>
    </div>
    <div class="row justify-content-center mb-5">
      <div class="col-2">
        <button @click="startGame" type="button" class="btn btn-primary">Start Game</button>
      </div>
    </div>

    <div class="row justify-content-center">
      <h3 class="text-center">Tic Tac Toe</h3>
      <div class="row justify-content-center mb-3">
        <div class="col-8">
          <div class="row justify-content-center">
            <Square id="0" v-on:square-click="onSquareClick" index="0" :isMarked="squares[0]['isMarked']" :mark="squares[0]['mark']"></Square>
            <Square id="1" v-on:square-click="onSquareClick" index="1" :isMarked="squares[1]['isMarked']" :mark="squares[1]['mark']"></Square>
            <Square id="2" v-on:square-click="onSquareClick" index="2" :isMarked="squares[2]['isMarked']" :mark="squares[2]['mark']"></Square>
          </div>
          <div class="row justify-content-center">
            <Square id="3" v-on:square-click="onSquareClick" index="3" :isMarked="squares[3]['isMarked']" :mark="squares[3]['mark']"></Square>
            <Square id="4" v-on:square-click="onSquareClick" index="4" :isMarked="squares[4]['isMarked']" :mark="squares[4]['mark']"></Square>
            <Square id="5" v-on:square-click="onSquareClick" index="5" :isMarked="squares[5]['isMarked']" :mark="squares[5]['mark']"></Square>
          </div>
          <div class="row justify-content-center">
            <Square id="6" v-on:square-click="onSquareClick" index="6" :isMarked="squares[6]['isMarked']" :mark="squares[6]['mark']"></Square>
            <Square id="7" v-on:square-click="onSquareClick" index="7" :isMarked="squares[7]['isMarked']" :mark="squares[7]['mark']"></Square>
            <Square id="8" v-on:square-click="onSquareClick" index="8" :isMarked="squares[8]['isMarked']" :mark="squares[8]['mark']"></Square>
          </div>
        </div>

      </div>

      <div class="row justify-content-center">
        <div class="col-2">
          <button @click="endTurn" type="button" class="btn btn-primary ">Finish Turn</button>
        </div>
        
      </div>
    </div>
  </div>
</template>

<style scoped>  
  .right-align {
    margin-left: auto;
  }


</style>

<script>
  import { mapState, mapMutations } from 'vuex';
  import axios from 'axios';
  export default {
    data() {
      return {
        showModal: true,
        player1Name: "",
        player2Name: "",
        disableForm: false,
        showAlert: false,
        showSuccessAlert: false,
        successMessage: "",
        errorMessage: "",
        gameID: 0,
        latestSelected: -1,
        squares: [
          {isMarked: false, mark: '', row: 0, column: 0},
          {isMarked: false, mark: '', row: 0, column: 1},
          {isMarked: false, mark: '', row: 0, column: 2},
          {isMarked: false, mark: '', row: 1, column: 0},
          {isMarked: false, mark: '', row: 1, column: 1},
          {isMarked: false, mark: '', row: 1, column: 2},
          {isMarked: false, mark: '', row: 2, column: 0},
          {isMarked: false, mark: '', row: 2, column: 1},
          {isMarked: false, mark: '', row: 2, column: 2}
        ]
      }
    },
    computed: {
    ...mapState(['currentPlayer', 'previousMovement'])
    },
    methods: {
      ...mapMutations(['changePlayer']),
      onSquareClick(value) {
        if(this.gameID === 0) {
          this.showAlert = true;
          this.errorMessage = "Please input player name";
          return
        }else if(this.gameID === -1) {
          this.showAlert = true;
          this.errorMessage = "Game is already over, Click reset button to restart the game"
        }
        if (this.$store.state.previousMovement !== ''){
          this.squares[this.$store.state.previousMovement]["mark"] = ''
          this.squares[this.$store.state.previousMovement]["isMarked"] = false
        }
        this.latestSelected = value
        this.$store.state.previousMovement = value
        this.squares[value]["mark"] = this.$store.state.currentPlayer
        this.squares[value]["isMarked"] = true
      },
      startGame() {
        let base_url = "http://localhost:3000/games" 
        axios.post(base_url, {
          player1: this.player1Name,
          player2: this.player2Name
        })
        .then((response) => {
          this.gameID = response.data.id;
          this.disableForm = true;
        })
        .catch( (error) => {
          this.showAlert = true;
          this.errorMessage = error.response.data.join(',');
        });
      },
      closeError() {
        this.showAlert = false;
        this.errorMessage = '';
      },
      closeSuccess() {
        this.showSuccessAlert = false;
        this.successMessage = '';
      },
      endTurn() {
        let base_url = "http://localhost:3000/movements" 
        axios.post(base_url, {
          column: this.squares[this.latestSelected]["column"],
          row: this.squares[this.latestSelected]["row"],
          game_id: this.gameID,
          player: this.$store.state.currentPlayer === "X" ? 1 : 2
        })
        .then((response) => {
          axios.get("http://localhost:3000/movements/check_winner" , 
          {params: {game_id: this.gameID, player: this.$store.state.currentPlayer === "X" ? 1 : 2}})
          .then((response) => {
            if (response.data.winner != "none") {
              this.showSuccessAlert = true
              this.successMessage = response.data.message
              this.gameID = -1
            }
          })
          this.changePlayer();
        })
        .catch( (error) => {
          this.showAlert = true;
          this.errorMessage = error.response.data.join(',');
        });
      }
    }
  }
</script>