Rails.application.routes.draw do
  get '/login', to: 'auth#show_login'
  get '/register', to: 'auth#show_register'
  post '/auth/login', to: 'auth#login'
  post '/auth/register', to: 'auth#register'
  post '/auth/logout', to: 'auth#logout'

  get '/product-group/:id' => 'product_group#show_groups'
  get '/products/:id' => 'product_group#show_subgroups'

  namespace :product do
    get '/:id', action: 'show'
  end

  namespace :account do
    get 'settings', to: 'settings#show'
    patch 'settings/:id', to: 'settings#edit'

    get 'addresses', to: 'address#show'
    get 'addresses/create', to: 'address#show_create'
    get 'addresses/update/:id', to: 'address#show_update'

    post 'addresses', to: 'address#create'
    patch 'addresses/:id', to: 'address#update'
    delete 'addresses/:id', to: 'address#delete'
  end

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
