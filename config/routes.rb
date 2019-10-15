# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :encrypted_memos
  namespace :admin do
    resources :documents
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: 'users#index'
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  authenticate :user, ->(u) { u.has_role?(:admin_portal) } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :documents
  namespace :users do
    resources :verification_codes, only: [:index]
    resources :login_activities
    resources :roles, only: [:index, :create, :destroy]
    get 'directory', to: 'directory#index'
    resources :profiles, only: [:show]
  end
  namespace :messages do
    get 'inbox', to: 'inbox#index'
    get 'sent', to: 'sentbox#index'
    resources :conversations do
      post 'reply', on: :member
    end
  end
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    invitations: 'users/invitations',
    registrations: 'users/registrations'
  }
  get '/go/:id' => "shortener/shortened_urls#show"
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
