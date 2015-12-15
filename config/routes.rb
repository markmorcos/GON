Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    devise_for :users
    post 'registrations/check_email' => 'registrations#check_email'
    post 'users/facebook_sign_in' => 'sessions#create_facebook'
    resources :users
    resources :likes
    resources :comments
    resources :friends
    resources :messages
    resources :posts
    get 'users/:id/current_friends' => 'users#friends'
    get 'users/:id/friend_requests' => 'users#pending'
    get 'users/:id/news_feed' => 'users#news_feed'
    post 'users/:id/change_name' => 'users#change_name'
    post 'users/:id/respond' => 'users#respond'
   
  end


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
