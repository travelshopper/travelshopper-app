Rails.application.routes.draw do

  get '/signup' => 'users#new', as: :signup
  resources :users , only: [:create]

  get '/signin' => 'sessions#new', as: :signin
  delete '/signout' => 'sessions#destroy', as: :signout
  resource :session, only: [:create]

  namespace :my do
    resource :dashboard, only: [:show]
    resources :itineraries
  end

  root 'pages#landing'
end
