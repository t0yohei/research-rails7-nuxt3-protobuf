<template>
  <div>
    <OpenApiTodoList />
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import OpenApiTodoList from '/components/openapi/TodoList.vue';

export default defineComponent({
  components: {
    OpenApiTodoList,
  },
});
</script>

<style scoped></style>
