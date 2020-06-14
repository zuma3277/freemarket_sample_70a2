Rails.application.routes.draw do
   root "sign_up#index"
   root "mypage#index"
   resources :logout, only: [:index]
   resources :creditcard, only:[:index, :new, :create]
end
