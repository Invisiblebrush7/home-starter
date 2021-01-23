Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/success', to: 'pages#success'
  get '/terms', to: 'pages#terms'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bundles_offers do
    resources :bookings, shallow: true
    resources :reviews, shallow: true
  end
end
