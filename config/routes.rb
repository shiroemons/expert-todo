Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  root 'welcome#index'

  get '/sign_up', to: 'users#new', as: :new_user
  post '/registration', to: 'users#create', as: :users
end
