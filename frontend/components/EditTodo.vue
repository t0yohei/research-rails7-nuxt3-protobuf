<template>
  <td>
    <template v-if="todo.completed">済</template>
    <template v-else>未</template>
  </td>
  <td><input :value="todo.name" @input="InputName" /></td>
  <td><input :value="todo.detail" @input="InputDetail" /></td>
  <td><button @click="clickSave">保存</button></td>
  <td>
    <template v-if="!todo.deleted"><button>削除</button></template>
  </td>
</template>

<script setup lang="ts">
import { Todo } from 'server/api/todo';

interface Props {
  todo: Todo;
}

interface Emits {
  (e: 'update-name', value: string, id: number): void;
  (e: 'update-detail', value: string, id: number): void;
  (e: 'save-todo', id: number): void;
}

const props = defineProps<Props>();

const emit = defineEmits<Emits>();
const InputName = (e: Event) => {
  if (e.target instanceof HTMLInputElement) {
    emit('update-name', e.target.value, props.todo.id);
  }
};
const InputDetail = (e: Event) => {
  if (e.target instanceof HTMLInputElement) {
    emit('update-detail', e.target.value, props.todo.id);
  }
};
const clickSave = () => {
  emit('save-todo', props.todo.id);
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
