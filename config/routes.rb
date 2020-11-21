Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 原始寫法
  # get '/', to: 'boards#index'
  root 'boards#index'

  resources :boards

  get '/users/sign_up', to: 'registrations#new', as: 'registration'
  post '/users', to: 'registrations#create'
  
  get '/users/sign_in', to: 'sessions#new', as: 'session'
  post '/login', to: 'sessions#create', as: 'login'

  delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'

  # devise對照
  # get '/users/sign_up', to: 'registrations#new', as: 'new_user_registration'
  # post '/users', to: 'registrations#create', as: 'user_registration'
  
  # get '/users/sign_in', to: 'sessions#new', as: 'new_user_session'
  # post '/users/sign_in', to: 'sessions#create', as: 'user_session'

  # delete '/users/sign_out', to: 'sessions#destroy', as: 'destroy_user_session'
  
end
