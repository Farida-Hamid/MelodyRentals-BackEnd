Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
