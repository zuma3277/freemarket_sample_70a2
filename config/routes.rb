Rails.application.routes.draw do


  root "index#index"

  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
  resources :mypages, only: [:index]
  resources :item_page, only: [:index]
  resources :products, only: [:index]
  resources :sign_up, only: [:index]
end
