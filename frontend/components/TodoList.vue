<template>
  <div>
    <table>
      <thead>
        <tr>
          <th>未/済</th>
          <th>名前</th>
          <th>詳細</th>
          <th>編集</th>
          <th>削除</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="todo in todos" v-bind:key="todo.id">
          <ShowTodo :todo="todo"></ShowTodo>
        </tr>
      </tbody>
    </table>
    <button>追加</button>
  </div>
</template>

<script setup lang="ts">
import ShowTodo from './ShowTodo.vue';
const { data: todos } = await useFetch('/api/todo');
</script>

<style scoped>
table,
td {
  border: 1px solid #333;
}

thead,
tfoot {
  background-color: rgb(116, 182, 237);
  color: rgb(255, 255, 255);
}
</style>
