Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:show, :index ] do
    resources :followings, only: [:create] do
      collection do
        delete 'unfollow', to: "followings#destroy"
      end
    end
  end

  resources :articles do
    resources :comments, only: [:index, :show, :create, :update, :destroy]

    resources :readings, only: [:index ] do
      collection do
        post 'like'
        post 'unlike'
        post 'recommend'
        patch 'recommend'
        post 'unrecommend'
      end
    end
  end

  get 'dashboard', to: 'pages#dashboard'
  root to: 'articles#index'
end
