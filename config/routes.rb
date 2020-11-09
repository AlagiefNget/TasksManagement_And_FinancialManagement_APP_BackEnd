Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end

  # get 'todos/index'
  # get 'todos/create'
  # get 'todos/update'
  # get 'todos/show'
  # get 'todos/destroy'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
