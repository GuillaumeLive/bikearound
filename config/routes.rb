Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'
  namespace :account do
    resources :bikes, only: [:index]
  end
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy] do
    member do
      patch 'mark_accepted'
      patch 'mark_refused'
    end
  end
end
