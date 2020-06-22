# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'accounts'
  resources :users
  namespace :books do
    resources :publishers
    resources :subjects
    resources :authors
  end
  resources :books
  resources :transactions
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
