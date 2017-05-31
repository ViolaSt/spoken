Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:show, :index ]

  resources :articles do
    resources :comments, only: [:index, :show, :create, :update, :destroy]
    resources :followings, only: [:create, :destroy]

    resources :readings, only: [:index ] do
      collection do
        post 'like'
        post 'unlike'
        post 'recommend'
        post 'unrecommend'
      end
    end
  end

  root to: 'articles#index'
end
