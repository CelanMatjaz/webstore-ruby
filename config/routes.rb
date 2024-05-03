Rails.application.routes.draw do
  get '/login', to: 'auth#show_login'
  get '/register', to: 'auth#show_register'
  post '/auth/login', to: 'auth#login'
  post '/auth/register', to: 'auth#register'
  post '/auth/logout', to: 'auth#logout'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'

    get 'users', to: 'users#index'
    get 'users/show'
    post 'users/create'
    put 'users/edit'
    delete 'users', to: 'users#delete'

    get 'products', to: 'products#index'
    get 'products/show'
    post 'products/create'
    put 'products/edit'
    delete 'products/delete'
  end

  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
