Rails.application.routes.draw do
  root 'welcome#index'

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  get '/sign_up', to: 'users#new', as: :new_user
  post '/registration', to: 'users#create', as: :users

  resources :tasks
end
