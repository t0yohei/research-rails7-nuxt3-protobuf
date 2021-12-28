<template>
  <ShowTodo
    v-if="todoState == 'show'"
    :todo="todo"
    @edit-todo="editTodo"
    @delete-todo="deleteTodo"
  ></ShowTodo>
  <EditTodo
    v-else
    :todo="todo"
    @update-name="updateName"
    @update-detail="updateDetail"
    @save-todo="saveTodo"
  ></EditTodo>
</template>

<script setup lang="ts">
import { Todo } from '~/lib/api/openapi/models/Todo';
import ShowTodo from './ShowTodo.vue';
import EditTodo from './EditTodo.vue';

interface Props {
  todo: Todo;
}
const props = defineProps<Props>();

interface Emits {
  (e: 'update-name', value: string, id: number): void;
  (e: 'update-detail', value: string, id: number): void;
  (e: 'save-todo', id: number): void;
  (e: 'delete-todo', id: number): void;
}
const emit = defineEmits<Emits>();

type todoStates = 'show' | 'new' | 'edit';
let todoState = ref<todoStates>('show');

const editTodo = () => {
  todoState.value = 'edit';
};

const updateName = (value: string) => {
  emit('update-name', value, props.todo.id);
};
const updateDetail = (value: string) => {
  emit('update-detail', value, props.todo.id);
};
const saveTodo = () => {
  todoState.value = 'show';
  emit('save-todo', props.todo.id);
};
const deleteTodo = () => {
  emit('delete-todo', props.todo.id);
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
