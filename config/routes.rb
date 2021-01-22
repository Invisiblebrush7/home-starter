Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/success', to: 'pages#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bundles_offers do
    # resources :reviews, only: [:edit]
    # resources :bookings, only: [:new, :create, :index, :show] do
    #   resources :reviews, only: [:create, :update, :edit]
    # end
    resources :bookings, shallow: true
    resources :reviews, shallow: true
  end
end
