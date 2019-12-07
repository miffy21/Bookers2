Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  resources :post_images, only: [:new, :create, :index, :show]
  get '/home/about' => 'homes#about'
  root to: 'homes#top'
end
