Rails.application.routes.draw do
  devise_for :users
  get 'map' => 'map#show'

  resources :spots
  resources :users, :only => [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id))', via: [:get, :post, :patch]
  root to: 'map#show'
end
