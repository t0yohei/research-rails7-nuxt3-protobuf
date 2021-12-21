<template>
  <ShowTodo v-if="todoState == 'show'" :todo="todo" @edit-todo="editTodo"></ShowTodo>
  <EditTodo
    v-else
    :todo="todo"
    @update-name="updateName"
    @update-detail="updateDetail"
    @save-todo="saveTodo"
  ></EditTodo>
</template>

<script setup lang="ts">
import { Todo } from 'server/api/todo';
import ShowTodo from './ShowTodo.vue';
import EditTodo from './EditTodo.vue';

interface Props {
  todo: Todo;
}
defineProps<Props>();

interface Emits {
  (e: 'update-name', value: string, id: number): void;
  (e: 'update-detail', value: string, id: number): void;
  (e: 'save-todo', id: number): void;
}
const emit = defineEmits<Emits>();

type todoStates = 'show' | 'new' | 'edit';
let todoState = ref<todoStates>('show');

const editTodo = () => {
  todoState.value = 'edit';
};

const updateName = (value: string, id: number) => {
  emit('update-name', value, id);
};
const updateDetail = (value: string, id: number) => {
  emit('update-detail', value, id);
};
const saveTodo = (id: number) => {
  todoState.value = 'show';
  emit('save-todo', id);
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
