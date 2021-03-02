Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#home'
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
end
