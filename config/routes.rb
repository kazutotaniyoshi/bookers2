Rails.application.routes.draw do
    devise_for :users
    get 'home/about' =>"homes#about"
    root to: 'homes#top'
    resources :books
    resources :users, only: [:show, :index, :edit, :update]
end
