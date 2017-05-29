Rails.application.routes.draw do
  get 'readings/index'

  get 'readings/create_like'

  get 'readings/destroy_like'

  get 'readings/create_recommendation'

  get 'readings/edit_recommendation'

  get 'readings/update_recommendation'

  get 'readings/destroy_recommendation'

  resources :articles
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
