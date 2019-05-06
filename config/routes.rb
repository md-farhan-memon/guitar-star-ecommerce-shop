Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#home'

  resources :products,   only: :show
  resources :line_items, only: %i[update destroy]

  resources :carts, only: :show do
    collection do
      post :move
      post :checkout
    end
  end
end
