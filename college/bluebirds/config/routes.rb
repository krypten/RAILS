Bluebirds::Application.routes.draw do
 
  resources :contacts

  resources :tmps

  controller "booking" do
    get 'booking/book' => :books
    post 'booking/book' => :book
    get 'booking/stage1' => :tmp1
    post 'booking/stage1'=> :stage1
    get 'booking/stage2' => :tmp2
    post 'booking/stage2'=> :stage2
  end
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
    get 'forgot' => :forget
    post 'forgot' => :forgot
    get 'change' => :change
    post 'change' => :changed
  end
  
  get "booking/book"
  get "booking/stage1"
  get "booking/stage2"
  get "sessions/create"
  get "sessions/forgot"
  get "sessions/changed"

  get "location/loc"
  get "social_media/twitter"
  
  resources :tickets do
    get 'new'
    get 'edit'
    get 'show'
    patch 'update'
    put 'update'
    delete 'destroy'
  end

  get "homes/index"

  root 'homes#index'

  resources :logins

  
  resources :orders

  resources :users

  resources :viewings

  resources :billing_infos

  resources :card_infos

  resources :couriers

  resources :audi_infos

  resources :pricings

  resources :movies

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
