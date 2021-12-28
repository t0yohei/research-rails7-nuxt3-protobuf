<template>
  <td>
    <template v-if="todo.completed">済</template>
    <template v-else>未</template>
  </td>
  <td>{{ todo.name }}</td>
  <td>{{ todo.detail }}</td>
  <td><button @click="clickEdit">編集</button></td>
  <td>
    <template v-if="!todo.deleted"
      ><button @click="clickDelete">削除</button></template
    >
  </td>
</template>

<script setup lang="ts">
import Todo from './todo.d';

interface Props {
  todo: Todo;
}
defineProps<Props>();

interface Emits {
  (e: 'edit-todo'): void;
  (e: 'delete-todo'): void;
}
const emit = defineEmits<Emits>();

const clickEdit = () => {
  emit('edit-todo');
};

const clickDelete = () => {
  emit('delete-todo');
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
