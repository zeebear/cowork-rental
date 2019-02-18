Rails.application.routes.draw do
  devise_for :users
  root to: 'offices#index'
  namespace :owner do
    resources :offices, except %i[new create]
    resources :bookings, except %i[new, create, delete]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
