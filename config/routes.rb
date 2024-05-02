Rails.application.routes.draw do
  namespace :admin do
    get '/dashboard', to: 'dashboard#index'

    get 'users', to: 'users#index'
    get 'users/show'
    post 'users/create'
    put 'users/edit'
    delete 'users/delete'

    get 'products', to: 'products#index'
    get 'products/show'
    post 'products/create'
    put 'products/edit'
    delete 'products/delete'
  end

  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
