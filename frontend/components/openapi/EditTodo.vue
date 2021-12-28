<template>
  <td>
    <template v-if="todo.completed">済</template>
    <template v-else>未</template>
  </td>
  <td><input :value="todo.name" @input="InputName" /></td>
  <td><input :value="todo.detail" @input="InputDetail" /></td>
  <td><button @click="clickSave">保存</button></td>
</template>

<script setup lang="ts">
import { TodoProperties } from '~/lib/api/openapi/models/TodoProperties';

interface Props {
  todo: TodoProperties;
}
defineProps<Props>();

interface Emits {
  (e: 'update-name', value: string): void;
  (e: 'update-detail', value: string): void;
  (e: 'save-todo'): void;
}
const emit = defineEmits<Emits>();

const InputName = (e: Event) => {
  if (e.target instanceof HTMLInputElement) {
    emit('update-name', e.target.value);
  }
};
const InputDetail = (e: Event) => {
  if (e.target instanceof HTMLInputElement) {
    emit('update-detail', e.target.value);
  }
};
const clickSave = () => {
  emit('save-todo');
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
