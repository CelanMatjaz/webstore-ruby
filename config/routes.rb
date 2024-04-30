Rails.application.routes.draw do
  namespace 'admin' do
    get '/dashboard', to: 'dashboard#index'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
