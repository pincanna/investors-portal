# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  use_doorkeeper_openid_connect
  use_doorkeeper
  resources :encrypted_memos
  namespace :admin do
    resources :documents
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: 'users#index'
  end
  namespace :api do
    namespace :v1 do
      resources :users do
        get 'me', on: :collection
      end
    end
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

    get 'directory', to: 'directory#index'
    resources :profiles, only: [:show] do
      resources :roles, only: [:create, :destroy]
    end
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
