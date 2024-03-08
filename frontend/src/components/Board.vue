<script setup>
import Square from './Square.vue'
</script>

<template>
  <div class="container">
    <div class="row mb-5 justify-content-center">
      <div class="row g-5 align-items-center mb-2">
        <div class="col-auto">
          <label for="inputPlayer1Name" class="col-form-label">Player 1 Name:</label>
        </div>
        <div class="col-auto">
          <input type="text" id="inputPlayer1Name" class="form-control">
        </div>
        <div class="col-auto">

        </div>

        <div class="col-auto right-align">
          <label for="inputPlayer2Name" class="col-form-label">Player 2 Name:</label>
        </div>
        <div class="col-auto">
          <input type="text" id="inputPlayer2Name" class="form-control">
        </div>
      </div>
    </div>
    <div class="row justify-content-center mb-5">
      <div class="col-md-4">
        <button @click="startGame" type="button" class="btn btn-primary">Start Game</button>
      </div>
    </div>

    <div class="row">
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

      <div class="col-7 mt-2 d-grid gap-2 d-md-flex justify-content-md-end">

        <button @click="endTurn" type="button" class="btn btn-primary ">Finish Turn</button>
      </div>
    </div>

    <div class="row mt-2">
      
      
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
  export default {
    data() {
      return {
        showModal: true,
        player1Name: "",
        player2Name: "",
        formPlayer1Name: "",
        formPlayer2Name: "",
        squares: [
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''},
          {isMarked: false, mark: ''}
        ]
      }
    },
    computed: {
    ...mapState(['currentPlayer', 'previousMovement'])
    },
    methods: {
      ...mapMutations(['changePlayer']),
      onSquareClick(value) {
        if (this.$store.state.previousMovement !== ''){
          this.squares[this.$store.state.previousMovement]["mark"] = ''
          this.squares[this.$store.state.previousMovement]["isMarked"] = false
        }
        this.$store.state.previousMovement = value
        this.squares[value]["mark"] = this.$store.state.currentPlayer
        this.squares[value]["isMarked"] = true
      },
      submitPlayerName() {
        this.playerName = this.formPlayerName
        this.formPlayerName = ""
        this.showModal = false
      },
      endTurn() {
        this.changePlayer();
        // call API
      }
    }
  }
</script>