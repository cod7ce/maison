Maison::Application.routes.draw do
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

  # 前台路由
  root :to => 'home#index'
  get 'about' => 'home#about', :as => 'about'
  resources :posts, :only => ['index', 'show']
  resources :gists, :only => ['index', 'show']
  
  # Gist 前台路由
  get '/gists/:user/:alias(.:format)', to: 'gists#show'
  get '/gists/:id/raw/:snippet_id/:filename', to: 'gists#raw'

  # Post 前台路由
  get '/posts/:user/:alias(.:format)', to: 'posts#show'
  # 壁纸API
  resources :wallpapers, :only => ['index']

  # 后台路由
  namespace :admin do
    root :to => 'home#index'
    resources :posts
    resources :gists
    resources :categories
    resources :wallpapers
    # 用户登录与注销
    get 'login' => 'sessions#new', :as => 'login'
    post 'login' => 'sessions#create', :as => 'post_login'
    get 'logout' => 'sessions#destroy', :as => 'logout'
  end
end
