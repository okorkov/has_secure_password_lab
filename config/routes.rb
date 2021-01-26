Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/signup/new', to: 'new#users'
  # post '/signup', to: 'create#users'
  # get '/login', to: 'new#sessions'
  # post '/sessions', to: 'create#sessions'
  resource :users, only: [:new, :create]
  resource :sessions, only: [:new, :create]
  get '/', to: 'welcomes#index'
end
