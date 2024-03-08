<template>
  <div class="col-4 col-sm-3 square" @click="emitSquareClick">
    {{ mark }}
  </div>
</template>

<style scoped>
  .square {
    background: #fff;
    border: 1px solid #999;
    font-size: 24px;
    font-weight: bold;
    line-height: 70px;
    height: 70px;
    margin-right: -1px;
    margin-top: -1px;
    padding: 0;
    text-align: center;
    width: 70px;
    display: flex;
    justify-content: center;
    align-items: center;
  }


</style>

<script>
  import { mapState, mapMutations } from 'vuex';


  export default {
    props: {
      index: '',
      mark: '',
      isMarked: false
    }, 
    computed: {
    ...mapState(['currentPlayer', 'previousMovement'])
    },
    methods: {
      emitSquareClick() {
        if (!this.isMarked) {
          this.$emit('square-click', this.index);
        }
      }
    }
  }
</script>