class Apiv1::TodoController < ApplicationController
  def index
    render json: Todo.all.to_json
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo.to_json
    else
      render json: { message: post.errors }, status: :bad_request
    end
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(create_params)
    render json: todo.to_json, status: :created
  end

  def destory
    todo = Todo.find(params[:id])
    todo.destory
    head :no_content
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :detail)
  end
end
