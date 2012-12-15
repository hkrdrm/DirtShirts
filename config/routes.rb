HeatherShirts::Application.routes.draw do
  get "users/index"
  devise_for :users
  get "checkout/index"

  get "store/index"


  get "checkout/payment"
  post "checkout/payment"
  get "checkout/s1_shipping"
  post "checkout/s1_shipping"
  get "checkout/s2_stripe"
  post "checkout/s2_stripe"
  post "checkout/process_card"
  match '/' => 'static_pages#home'
  match '/users/show/:id', :to => 'users#show', :as => :user
  match '/users/:id/edit', :to => 'users#edit', :as => :user_path
  match '/users/:id/update', :to => 'users#update'

  post "orders/destroy"
  post "orders/show"
  post "orders/ship"
  match "/orders/:id/ship", :to => 'orders#ship', :as => :ship_path
  post "orders/:id/ship"
  get "orders/data_source"
  post "checkout/save_order"
  get "store/index"
  get "54.245.118.77/store"


  root :to => "static_pages#home"


  get "static_pages/home"
  post "store/add_to_cart"
  post "store/empty_cart"
  get "store/checkout"
  post "store/checkout"
  post "checkout/empty_cart"
  get "static_pages/contact"
  resources :users
  resources :products
  resources :store
  resources :checkout
  resources :orders
  resources :admin
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
