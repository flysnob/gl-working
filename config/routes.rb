Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  devise_for :users

  authenticate :user do
    root to: 'pages#index'

    resources :users

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

    resources :questions, except: [] do
      member do
        get 'delete_modal', to: 'questions#delete_modal'
        patch 'delete', to: 'questions#delete'
      end
    end

    resources :subjects, except: [] do
      get 'home', to: 'subjects#subject_home'
      member do
        get 'delete_modal', to: 'subjects#delete_modal'
        patch 'delete', to: 'subjects#delete'
      end
    end

    resources :versions, except: [] do
      member do
        get 'delete_modal', to: 'versions#delete_modal'
        get 'show_version_nodes', to: 'versions#show_version_nodes'
        patch 'delete', to: 'versions#delete'
      end
    end

    resources :reports
  end
end
