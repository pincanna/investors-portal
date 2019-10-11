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

  resources :documents
  namespace :users do
    resources :verification_codes, only: [:index]
    resources :login_activities
  end
  namespace :messages do
    get 'inbox', to: 'inbox#index'
    resources :conversations
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
