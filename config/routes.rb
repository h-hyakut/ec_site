Rails.application.routes.draw do
  resources :taggings
  resources :books
  resources :tags
end
