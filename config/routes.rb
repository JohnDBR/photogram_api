Rails.application.routes.draw do
   resources :users, only: [:index, :show, :create, :update, :destroy] 
  # get 'users/:id', to: 'users#show' #What the code up do...

  resources :sessions, only: :create
  delete 'sessions', to: 'sessions#destroy' 

  resources :posts, only: [:index, :create, :destroy]
  namespace :users do get ':user_id/posts', to: 'posts#index' end

end
