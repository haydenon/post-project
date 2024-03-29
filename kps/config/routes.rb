Kps::Application.routes.draw do
  get "discontinue_event/show"
  get "cost_event/show"
  get "price_event/show"
  get "mail_event/show"
  devise_for :users
  resources :events

  get "events/new"

  get '/figures' => 'figures#index'

  get 'figures/event_figures/:id' => 'figures#event_figures'

  get '/help' => 'kps#help'
  
  resources :companies

  resources :mail_requests

  resources :mail_request_route_segments

  resources :priorities

  resources :mail_routes do
    collection do
      post 'find'
    end
  end

  resources :route_segments

  resources :locations
  
  resources :mail_event
  
  resources :price_event
  
  resources :cost_event
  
  resources :discontinue_event
  
  resources :home
  

  get "kps/index"
	#get "home/index"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'kps#index'
   root 'home#index'

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
