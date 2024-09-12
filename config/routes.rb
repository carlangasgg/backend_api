Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :products
      resources :categories
      mount_devise_token_auth_for 'User', at: 'users', controllers: {
        sessions: 'api/v1/sessions/sessions',
        registrations: 'api/v1/sessions/registrations',
        confirmations: 'api/v1/confirmations'
      }
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
