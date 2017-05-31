Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index ] do
  end
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
