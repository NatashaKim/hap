Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  root 'events#index'
  get 'users/:id' => 'users#show', :as => :user

  resources :events do
  	resources :votes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
