import type { IncomingMessage, ServerResponse } from 'http';

export interface Todo {
  id: number;
  name: string;
  detail: string;
  completed: boolean;
  deleted: boolean;
  created_at: string;
  updated_at: string;
}

export default async (req: IncomingMessage, res: ServerResponse) => {
  const result: Todo[] = await $fetch('http://localhost:3000/apiv1/todo');

  return result;
};
