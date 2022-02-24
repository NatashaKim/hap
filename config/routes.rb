Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  get 'users/index'
  get 'users/:id' => 'users#show', :as => :user

  get 'promo', to: 'promo#index'
  root 'promo#index'

  resources :events do
  	resources :votes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
