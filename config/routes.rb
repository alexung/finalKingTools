Rails.application.routes.draw do
  resources :contact
  resources :product do
    collection { post :import }
  end
  resources :users
  get '/manage-products', to: 'users#manage_products'
  root 'welcome#index'
  post '/sent', to: "contact#sent"

  # get :search, :action => 'search_product', :as => 'search_product'
  # get 'search/:q', :action => 'search', :as => 'search'
end
