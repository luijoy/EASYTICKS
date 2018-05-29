Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :tickets do
  resources :confirmation, only: [:show]
  end
  resource :requests, only: [:create, :destroy]
  resource :reports, only: [:create, :show]

  get '/dashboard', to: 'users#dashboard'

  get 'tickets/:id/confirm', to: "tickets#confirmation"

end
