Rails.application.routes.draw do
  devise_for :users
  get 'map' => 'map#show'

  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id))', via: [:get, :post, :patch]
  root to: 'map#show'
end
