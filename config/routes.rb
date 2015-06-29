Rails.application.routes.draw do
  
  # You can have the root of your site routed with "root"
  root 'pages#home'

  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'privacy' => 'pages#privacy'
  get 'sitemap' => 'pages#sitemap'

  devise_for :users, :skip => [:sessions, :registrations]

  devise_scope :user do
    get    "login",           to: "devise/sessions#new",          as: :new_user_session
    post   "login",           to: "devise/sessions#create",       as: :user_session
    delete "logout",          to: "devise/sessions#destroy",      as: :destroy_user_session
 
    get    "sign-up",           to: "devise/registrations#new",     as: :new_user_registration
    post   "sign-up",           to: "devise/registrations#create",  as: :user_registration
    get    "user/delete",       to: "devise/registrations#cancel",  as: :cancel_user_registration

    get    "user/profile/edit", to: "devise/registrations#edit",    as: :edit_user_registration
    
    patch  "user",              to: "devise/registrations#update"
    put    "user",              to: "devise/registrations#update"
    put    "sign-up",           to: "devise/registrations#update"
    delete "user/delete",       to: "devise/registrations#destrony"

    get    "user/profile",      to: 'devise/registrations#edit',    as: :user_root
  end

  
  ##########################
  ## To get to work later.##
  ##########################

  # get 'signup' => 'users/sign_up'
  # get 'signin' => 'devise/sessions#new'
  
  ##########################
  ##         END          ##
  ##########################

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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


