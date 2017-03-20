Rails.application.routes.draw do
  resources :spots
  resources :fan_comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id))', via: [:get, :post, :patch]
  root to: 'spots#index'
end
