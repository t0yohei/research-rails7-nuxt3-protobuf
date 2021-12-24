require "#{Rails.root}/lib/protos/todo_pb.rb"

class Apiv2::TodoController < ApplicationController
  def index
    todos = Todo.all
    todos_proto = ::Protos::Todos.new
    todos.each do |todo|
      todo_proto = ::Protos::Todo.new(
        id: todo.id,
        name: todo.name,
        detail: todo.detail,
        completed: todo.completed,
        deleted: todo.deleted,
      )
      todos_proto.todo.push(todo_proto)
    end

    response = ::Protos::IndexTodoResponse.new(todos: todos_proto)
    render json: response.to_json
  end

  # def create
  #   todo = Todo.new(todo_params)
  #   if todo.save
  #     render json: todo.to_json
  #   else
  #     render json: { message: post.errors }, status: :bad_request
  #   end
  # end

  # def update
  #   todo = Todo.find(params[:id])
  #   todo.update(todo_params)
  #   render json: todo.to_json, status: :created
  # end

  # def destroy
  #   todo = Todo.find(params[:id])
  #   todo.destroy
  #   head :no_content
  # end

  # private

  # def todo_params
  #   params.require(:todo).permit(:name, :detail)
  # end
end
