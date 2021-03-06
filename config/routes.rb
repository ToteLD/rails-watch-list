Rails.application.routes.draw do
  resources :bookmarks, only: [:destroy]
  root to: 'lists#index'
  resources :lists, only: [:show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create]
    resources :bookmarks, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
