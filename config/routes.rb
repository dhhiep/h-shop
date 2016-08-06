Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index], path: '/'
  
  resources :products, only: [:index, :show] do
  end

  resources :transactions, only: [], path: '/' do
    collection do
      get :cart
      post :cart
      match 'checkout(/:step)', :action => :checkout, :as => :checkout, via: [:get, :post]
      post :place_order
      get "order/:id/completed" => :completed, as: :completed
    end
  end

  root 'home#index'

  unless Rails.env.development?
    get "*any", via: :all, to: 'application#render_not_found'
  end
end
