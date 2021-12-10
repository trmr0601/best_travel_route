Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "users#index"
  resources :transportations
  resources :attractions
  resources :feedbacks
  resources :routes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
