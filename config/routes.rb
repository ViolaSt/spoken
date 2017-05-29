Rails.application.routes.draw do
  get 'followings/create'

  get 'followings/destroy'

  get 'comments/index'

  get 'comments/show'

  get 'comments/create'

  get 'comments/update'

  get 'comments/destroy'

  resources :articles
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
