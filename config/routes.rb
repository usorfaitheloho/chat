Rails.application.routes.draw do
  # root "users#index"
  scope :api, defaults: { format: 'json' } do
    devise_for :users, 
    controllers: { 
      registrations: 'users/registrations',
      sessions: 'users/sessions' }
end
  # resources :users

 namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users
      resources :chats do
        resources :messages
        resources :particpants
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
