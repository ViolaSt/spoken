Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index ] do
  end
  resources :articles do
    resources :comments, only: [:index, :show, :create, :update, :destroy]
    resources :followings, only: [:create, :destroy]
    resources :readings, only: [:index, :create_like, :destroy_like, :create_recommendation, :edit_recommendation, :update_recommendation, :destroy_recommendation ]
  end

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
