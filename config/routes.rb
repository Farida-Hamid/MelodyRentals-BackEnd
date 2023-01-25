Rails.application.routes.draw do
  get '/auth/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :instruments
      resources :reservations, only: [:index, :create, :destroy]
    end
  end
end
