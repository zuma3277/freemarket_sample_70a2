Rails.application.routes.draw do
  root "mypage#index"
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
  root "products#index"
  resources :products, only: [:index]
end
