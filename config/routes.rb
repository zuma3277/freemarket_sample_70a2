Rails.application.routes.draw do
  root "mypage#index"
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
  resources :mypage, only: [:index]
  resources :item_page, only: [:index]
  resources :products, only: [:index]
end
