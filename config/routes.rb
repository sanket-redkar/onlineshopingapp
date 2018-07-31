Rails.application.routes.draw do

  resources :accessories, except: [:show]
  resources :product_details, only: [] do
    collection do
      delete :minus, path: '/minus/:source_id/:source_type', constraints: { source_type: /Product|Accessory/}
      post :add, path: '/add/:source_id/:source_type', constraints: { source_type: /Product|Accessory/}
    end
  end
  resources :shoping_cards, except: [:new, :update, :edit] do
    put :purchase, on: :member
  end
  resources :products, except: [:show]
  resources :brands, except: [:show]
  devise_for :users
  # resources :users

  root 'products#index'
end
