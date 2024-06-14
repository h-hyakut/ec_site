Rails.application.routes.draw do
  devise_for :users
  get :mypage, to: "mypage#index"

  resources :taggings
  resources :books
  resources :tags
  resources :products, only: [:index, :show]
  resources :orders
end
