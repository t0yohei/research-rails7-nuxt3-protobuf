/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { Todo } from '../models/Todo';
import type { Todos } from '../models/Todos';
import type { CancelablePromise } from '../core/CancelablePromise';
import { request as __request } from '../core/request';

export class ServiceService {

    /**
     * TODOをすべて取得する
     * @returns Todos TODOの配列
     * @returns any Created
     * @throws ApiError
     */
    public static getTodos(): CancelablePromise<Todos | any> {
        return __request({
            method: 'GET',
            path: `/apiv3/todos`,
        });
    }

    /**
     * @param todoId todoのid
     * @param requestBody
     * @returns Todo 単体のTodo
     * @throws ApiError
     */
    public static putTodo(
        todoId: number,
        requestBody?: {
            todo: {
                name: string;
                detail: string;
            };
        },
    ): CancelablePromise<Todo> {
        return __request({
            method: 'PUT',
            path: `/apiv3/todos/${todoId}`,
            body: requestBody,
            mediaType: 'application/json',
            errors: {
                400: `Bad Request`,
            },
        });
    }

    /**
     * @param todoId todoのid
     * @returns void
     * @throws ApiError
     */
    public static deleteTodo(
        todoId: number,
    ): CancelablePromise<void> {
        return __request({
            method: 'DELETE',
            path: `/apiv3/todos/${todoId}`,
        });
    }

}