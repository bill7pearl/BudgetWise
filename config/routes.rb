Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :new, :create, :destroy] do
    resources :entities, only: [:index, :new, :create, :destroy]
  end

  devise_scope :user do

    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root "home#index", as: :unauthenticated_root
    end

  end
end