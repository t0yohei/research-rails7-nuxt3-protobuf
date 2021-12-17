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
          <EditTodo :todo="todo" @update-name="updateName" @update-detail="updateDetail"></EditTodo>
        </tr>
      </tbody>
    </table>
    <button>追加</button>
  </div>
</template>

<script setup lang="ts">
import ShowTodo from './ShowTodo.vue';
import EditTodo from './EditTodo.vue';
const { data: todos } = await useFetch('/api/todo');

const updateName = (value: string, id: number): void => {
  const targetTodo = todos.value.find((todo) => todo.id === id);
  if (targetTodo !== undefined) {
    targetTodo.name = value;
  }
};

const updateDetail = (value: string, id: number): void => {
  const targetTodo = todos.value.find((todo) => todo.id === id);
  if (targetTodo !== undefined) {
    targetTodo.detail = value;
  }
};
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
