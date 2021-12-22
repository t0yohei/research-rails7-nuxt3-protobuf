Rails.application.routes.draw do
  namespace :apiv1 do
    get 'hello_world/index'

    resources :todo, only: [:index, :create, :update, :destroy]
  end
end
