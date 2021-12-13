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
          <td>
            <template v-if="todo.completed">済</template>
            <template v-else>未</template>
          </td>
          <td>{{ todo.name }}</td>
          <td>{{ todo.detail }}</td>
          <td><button>編集</button></td>
          <td>
            <template v-if="!todo.deleted"><button>削除</button></template>
          </td>
        </tr>
      </tbody>
    </table>
    <button>追加</button>
  </div>
</template>

<script lang="ts">
import Vue, { reactive } from 'vue';

export default Vue.defineComponent({
  setup() {
    const todos = reactive([
      {
        id: 1,
        name: 'hoge',
        detail: 'this is detail',
        completed: false,
        deleted: false,
      },
    ]);

    return { todos };
  },
});
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
