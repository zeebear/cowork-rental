Rails.application.routes.draw do
  root to: 'offices#index'
  namespace :owner do
    resources :offices, only: :index
    resources :bookings, only: [:index, :edit, :update]
  end

  resources :offices do
    resources :reviews, only: [:index]
  end
  resources :bookings, only: [:edit, :update, :index, :delete] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users
  resources :offices, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]
  end

  post 'owner/bookings/:id/edit', to: 'owner/bookings#approve', as: :booking_approve
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
