Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :projects
    root to: 'users#index'
  end

  devise_for :users

  authenticate :user do
    root to: 'pages#index'

    resources :users

    resources :projects, except: [] do
      member do
        get 'delete_modal', to: 'projects#delete_modal'
        patch 'delete', to: 'projects#delete'
        get 'work', to: 'projects#work'
        get 'previous', to: 'projects#previous'
      end
    end

    scope :pages do
      get 'about', to: 'pages#about'
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
        get 'versions', to: 'subjects#versions'
        get 'description', to: 'subjects#description'
      end
    end

    resources :versions, except: [] do
      member do
        get 'delete_modal', to: 'versions#delete_modal'
        get 'show_version_nodes', to: 'versions#show_version_nodes'
        patch 'delete', to: 'versions#delete'
      end
    end

    resources :nodes, only: [] do
      member do
        get 'comment', to: 'nodes#comment'
      end
    end

    resources :content, except: [] do
      member do
        get 'delete_modal', to: 'contents#delete_modal'
        patch 'delete', to: 'contents#delete'
      end
    end

    scope :reports do
      get 'project/:id', to: 'reports#project'
    end

    scope :v1 do
      get 'work/:project_id', to: 'v1#work'
      get 'previous/:project_id', to: 'v1#previous'
    end
  end
end
