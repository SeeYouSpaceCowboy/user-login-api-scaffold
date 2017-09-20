Rails.application.routes.draw do
  root 'user#login'

  scope module: 'api' do
    namespace :v1 do
      resources :users, only: [:index, :destroy]
      get 'user', to: 'user#show', as: 'user_show'
      post 'signup', to: 'user#create', as: 'user_signup'
      post 'login', to: 'user#login', as: 'user_login'
    end
  end
end
