Rails.application.routes.draw do


  devise_for :users
  root "index#index"
  resources :purchase, only: [:index] 
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
  resources :mypages, only: [:index]
  resources :item_page, only: [:index]
  resources :comp_reg, only: [:index]
  resources :products, only: [:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grand_children', defaults: {fomat: 'json'}
    end
  end
  resources :sign_up, only: [:index]
  resources :login, only: [:index]
end
