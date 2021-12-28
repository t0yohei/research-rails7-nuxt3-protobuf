class Apiv3::TodosController < ApplicationController
  def index
    render json: { todos: Todo.all }
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
    todo.update(todo_params)
    render json: todo.to_json, status: :created
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :detail)
  end
end
