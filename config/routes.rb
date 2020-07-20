Rails.application.routes.draw do
  root "index#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :purchase, only: [:index]
  resources :logout, only: [:index]
  resources :creditcard, only:[:index, :new, :create]
  resources :mypages, only: [:index]
  resources :item_page, only: [:index]
  resources :comp_reg, only: [:index]
  
  resources :products, only: [:create, :index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grand_children', defaults: {fomat: 'json'}
    end
  end
  resources :sign_up, only: [:index]
  resources :login, only: [:index]
  resources :users
end
