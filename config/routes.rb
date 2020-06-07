Rails.application.routes.draw do
  root "messages#index"
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
end
