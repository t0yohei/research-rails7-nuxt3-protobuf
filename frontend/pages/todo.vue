<template>
  <div>
    <TodoList />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import TodoList from '/components/TodoList.vue'

export default Vue.defineComponent({
  components: {
    TodoList
  }
})
</script>

<style scoped></style>
