Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only:[:new, :index, :show, :destroy, :create, :edit, :update]
  resources :users, only:[:edit, :show ,:index ,:update]
  get "home/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
