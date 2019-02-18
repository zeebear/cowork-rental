Rails.application.routes.draw do
  devise_for :users
  root to: 'offices#index'
  resources :offices, only: [:new, :create, :index, :show] do
    resources :booking, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
