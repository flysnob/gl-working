Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  root to: 'visitors#index'

  devise_for :users

  resources :users

  resources :responses

  resources :projects, except: [] do
    member do
      get 'work', to: 'projects#work'
      get 'previous', to: 'projects#previous'
      get 'delete_modal', to: 'projects#delete_modal'
      patch 'delete', to: 'projects#delete'
    end
  end

  resources :subjects, except: [] do
    member do
      get 'versions', to: 'subjects#versions'
    end
  end

  resources :pages, only: [] do
    collection do
      get 'about', to: 'pages#about'
    end
  end

  resources :notifications, only: [:index, :destroy] do
  end
end
