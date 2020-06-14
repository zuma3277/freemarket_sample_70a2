Rails.application.routes.draw do
  root "index#index"
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
end
