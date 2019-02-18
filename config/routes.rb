Rails.application.routes.draw do
  root to: 'offices#index'
  namespace :owner do
    resources :offices, except: [:new, :create]
    resources :bookings, except: [:new, :create, :delete]
  end
  devise_for :users
  resources :offices, only: [:new, :create, :index, :show] do
    resources :booking, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
