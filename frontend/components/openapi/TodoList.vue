<template>
  <div>
    <table>
      <thead>
        <tr>
          <th>未/済</th>
          <th class="name">名前</th>
          <th class="detail">詳細</th>
          <th>編集</th>
          <th>削除</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="todo in state.todos" v-bind:key="todo.id">
          <TodoRow
            :todo="todo"
            @update-name="updateName"
            @update-detail="updateDetail"
            @save-todo="saveTodo"
            @delete-todo="deleteTodo"
          ></TodoRow>
        </tr>
      </tbody>
    </table>
    <button @click="addTodo">追加</button>
  </div>
</template>

<script setup lang="ts">
import TodoRow from './TodoRow.vue';
import { Todos } from '~/lib/api/openapi/models/Todos';
import { ServiceService } from '~/lib/api/openapi/services/ServiceService';

const todos: Todos = await ServiceService.getTodos().then((result) => {
  return result;
});
const state = reactive<Todos>(todos);

const updateName = (value: string, id: number): void => {
  const targetTodo = state.todos.find((todo) => todo.id === id);
  if (targetTodo !== undefined) {
    targetTodo.name = value;
  }
};

const updateDetail = (value: string, id: number): void => {
  const targetTodo = state.todos.find((todo) => todo.id === id);
  if (targetTodo !== undefined) {
    targetTodo.detail = value;
  }
};

const saveTodo = async (id: number): Promise<void> => {
  const targetTodo = state.todos.find((todo) => todo.id === id);
  if (targetTodo == undefined) {
    return;
  }
  await ServiceService.putTodo(targetTodo.id, {
    todo: { name: targetTodo.name, detail: targetTodo.detail },
  }).then((result) => {
    console.log(result);
  });
};

const deleteTodo = async (id: number): Promise<void> => {
  const targetTodo = state.todos.find((todo) => todo.id === id);
  if (targetTodo == undefined) {
    return;
  }
  const res = await $fetch(
    `http://localhost:3000/apiv1/todo/${targetTodo.id}`,
    {
      method: 'DELETE',
    }
  );
  const newTodos = state.todos.filter((v) => {
    return v.id !== id;
  });
  state.todos = newTodos;
};

const addTodo = async () => {
  // const res: Todo = await $fetch('http://localhost:3000/apiv1/todo', {
  //   method: 'POST',
  //   body: { name: '', detail: '' },
  // });
  // state.todos.push(res);
};
</script>

<style scoped>
table,
td {
  border: 1px solid #333;
}
.name,
.detail {
  width: 150px;
}

thead,
tfoot {
  background-color: rgb(116, 182, 237);
  color: rgb(255, 255, 255);
}
</style>
