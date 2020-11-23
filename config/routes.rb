Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 原始寫法
  # get '/', to: 'boards#index'
  root 'boards#index'

  resources :boards

  # resource :users, controller: 'registrations', only: [:create, :edit, :update] do
  #   get '/sign_up', action: 'new'
  # end
  
    # post '/users', to: 'registrations#create'
    # get 'users/edit', to: 'registrations#edit', as: 'edit_registration'
    # put 'users/edit', to: 'registrations#update', as: 'update_registration'
    # get '/users/sign_up', to: 'registrations#new', as: 'registration'

  # resource :users, controller: 'sessions', only: [] do 
  #   get 'sign_in', action: 'new'
  #   post 'sign_in', action: 'create'
  #   delete 'sign_out', action: 'destroy'
  # end

  # get '/users/sign_in', to: 'sessions#new', as: 'session'
  # post '/login', to: 'sessions#create', as: 'login'

  # delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'

  
  resource :users, only: [] do 
    resource :registrations, path: '/', as: 'registration', only: [:create, :edit, :update] do
      get '/sign_up', action: 'new', as: 'new'
      # get '/sign_up', to: 'registrations#new', as: 'new'
    end
    resource :sessions, path: '/', as: 'session', only: [] do
      get 'sign_in', action: 'new', as: 'new'
      post 'sign_in', action: 'create', as: '/'
      delete 'sign_out', action: 'destroy', as: "destroy"
    end
  end
  
end