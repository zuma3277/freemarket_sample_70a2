Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mypage#index"
  resources :messages, only: [:index]
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
  resources :item_page, only: [:index]
  resources :products, only: [:index]
end
