Rails.application.routes.draw do
  devise_for :users
  get :mypage, to: "mypage#index"
  
  resources :taggings
  resources :books
  resources :tags
end
