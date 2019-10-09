require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :documents
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: "users#index"
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  authenticate :user, lambda { |u| u.has_role?(:admin_portal) } do
    mount Sidekiq::Web => '/sidekiq'
  end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    invitations: 'users/invitations',
    registrations: 'users/registrations' }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
