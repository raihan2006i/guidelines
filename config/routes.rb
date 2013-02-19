Guidelines::Application.routes.draw do

  # get "user/index"

  ActiveAdmin.routes(self)

  devise_for :admin_user, ActiveAdmin::Devise.config

  get "profiles/show"
  get "guidelines/list"
  get "guidelines/topic"
  get "guidelines/listhospital"
  get "guidelines/topichospital"
  get "about/about"
  get "guidelines/favourite"
  get "favourites/show"
  get "guidelines/listspecialty"
  get "guidelines/topicspecialty"
  match "specialty", to: "guidelines#listspecialty", as: :specialty

  devise_for :users

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'edit', to: 'devise/registrations#edit', as: :edit
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    get 'about', to: 'about#about', as: :about
  end

  resources :guidelines
  get 'guidelines', to: 'guidelines#index', as: :guidelines
  root :to => 'guidelines#index'

  get '/:id', to: 'profiles#show'
  get '/:id', to: 'favourites#show'
  get '/:id', to: 'guidelines#topic'
  get '/:id', to: 'guidelines#topicspecialty'

  

  

 
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
