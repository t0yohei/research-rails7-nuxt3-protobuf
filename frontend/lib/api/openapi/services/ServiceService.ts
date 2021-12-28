/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { Todos } from '../models/Todos';
import type { CancelablePromise } from '../core/CancelablePromise';
import { request as __request } from '../core/request';

export class ServiceService {

    /**
     * TODOをすべて取得する
     * @returns Todos TODOの配列
     * @throws ApiError
     */
    public static getTodos(): CancelablePromise<Todos> {
        return __request({
            method: 'GET',
            path: `/apiv3/todos`,
        });
    }

}