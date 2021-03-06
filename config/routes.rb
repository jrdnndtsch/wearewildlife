 Rails.application.routes.draw do
  # resources :fr_tweets
  # resources :fr_grams
  # resources :fr_blogs
  resources :titles
  # get 'admin/show'

  # get 'front_page/show'
  # match '/', to: 'front_page#show', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  get 'fr' => 'front_page#fr_show'
  get 'en' => 'front_page#show'
  # match '/', to: 'front_page#fr_show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  get 'home' => 'front_page#home'
  devise_for :users, :controllers => { :registrations => "my_devise/registrations" }
  resources :sub_menus

  # You can have the root of your site routed with "root"
  root 'front_page#home'

  get 'admin/show'
  # resources :articles, module: 'admin'
  namespace :admin do
    resources :blogs
    resources :fr_blogs
    resources :generic_stories
    resources :main_menus
    resources :stories
    resources :headers
    resources :featured_donors
    get 'upload_tweets' => 'tweets#upload'
    get 'upload_fr_tweets' => 'fr_tweets#upload'
    get 'upload_instas' => 'instas#upload'
    get 'upload_wps' => 'blogs#upload'
    get 'upload_fr_wps' => 'fr_blogs#upload'
  end    

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
