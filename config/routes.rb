Rails.application.routes.draw do
  root "messages#index"
  get 'logout/index'
  get 'creditcard/index'
  get 'creditcard/new'
  get 'creditcard/create'
end
