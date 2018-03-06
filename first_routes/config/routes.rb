Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks do
    resources :comments, only: [:index]
  end

  # resources :artworks, only: [:create, :show, :update, :destroy]

  resources :artwork_shares, only: [:index, :create, :show, :update, :destroy]

end
