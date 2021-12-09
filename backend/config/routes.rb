Rails.application.routes.draw do
  namespace :apiv1 do
    get 'hello_world/index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
