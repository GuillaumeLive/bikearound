Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
end
