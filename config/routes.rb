Rails.application.routes.draw do
  devise_for :users
  get :mypage, to: "mypage#index"

  resources :taggings
  resources :books
  resources :tags, except: :show
  resources :products, only: [:index, :show] 
  
  
  resources :orders, only: [:new, :create] do
    collection do
      get :confirm
      get :complete
    end
  end
  
  resources :line_items, only: [:create, :destroy]
  resources :carts, only: [:show, :destroy]
  resources :quentity

end
