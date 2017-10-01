Rails.application.routes.draw do
  root 'welcome#index'

  get '/sign_up', to: 'users#new', as: :new_user
  post '/registration', to: 'users#create', as: :users
end
