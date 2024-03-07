<script setup>
import Square from './Square.vue'
// import {Row} from boostrap
</script>

<template>
  <div class="board-row">
    <div class="board-row">
      <Square></Square>
      <Square></Square>
      <Square></Square>
    </div>
    <div class="board-row">
      <Square></Square>
      <Square></Square>
      <Square></Square>
    </div>
    <div class="board-row">
      <Square></Square>
      <Square></Square>
      <Square></Square>
    </div>
  </div>
  
</template>

<style scoped>  
  .board-row:after {
    clear: both;
    content: '';
    display: table;
  }

</style>