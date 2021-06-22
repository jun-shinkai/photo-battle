Rails.application.routes.draw do
  devise_for :users
 root to: "photos#index"
 resources :users, only: :show
 resources :photos do
  resources :comments, only: :create
  collection do
    get 'search'
  end
  resources :orders, only:[:index,:create]
 end

 post 'like/:id' => 'likes#create', as: 'create_like'
 delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
