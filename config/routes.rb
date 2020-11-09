Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards


  # 原始寫法
  # get '/', to: 'boards#index'
  root 'boards#index'

  
end
