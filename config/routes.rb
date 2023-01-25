Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }, path: "",
                     path_names: {
                       sign_in: "api/v1/auth/login",
                       sign_out: "api/v1/auth/logout",
                       registration: "api/v1/auth/signup",
                     },
                     controllers: {
                       sessions: "api/v1/users/sessions",
                       registrations: "api/v1/users/registrations",
                     }

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :search], controller: "users/users"
      resources :instruments
      resources :reservations, only: [:index, :create, :destroy]
    end
  end
end
