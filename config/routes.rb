Rails.application.routes.draw do
  resources :reports
  resources :doses
  resources :user_medications
  resources :medications
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/restore-session', to: 'sessions#restore';
  post '/signup', to: 'session#signup';
  post '/login', to: 'sessions#login';
end
