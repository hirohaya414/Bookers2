Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  resources :books, only:[:new, :create, :index, :show]
  resources :users, only:[:index, :show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
