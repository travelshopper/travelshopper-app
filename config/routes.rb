Rails.application.routes.draw do

  get '/signup' => 'users#new', as: :signup
  resources :users , only: [:create]

  namespace :my do
    resource :dashboard, only: [:show]
  end

  root 'pages#landing'
end
