Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boards, only: [:new, :create, :index, :show] do
  	resources :responses, only: [:create, :destroy]
  end

  resources :categories, only: [:show]

  resources :users, only: [:show, :edit, :update]

end
