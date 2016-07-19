Rails.application.routes.draw do

  resources :stories

  get 'pages/resources'

  resources :companies

  ## Site's Root Route
  root 'pages#home'

  ## Static Page Routes
  get 'home'      => 'pages#home'
  get 'about'     => 'pages#about'
  get 'resources' => 'pages#resources'
  get 'stories'   => 'pages#stories'
  get 'contact'   => 'pages#contact'
  get 'privacy'   => 'pages#privacy'
  get 'sitemap'   => 'pages#sitemap'

  ## Administrative Routes
  get 'admin/dashboard'
  get 'admin/moderate_users'
  get 'admin/edit_user'
  get 'admin/moderate_events'
  get 'admin/moderate_event_items'
  get 'admin/moderate_companies'
  get 'admin/moderate_locations'
  get 'admin/moderate_stories'

  ## Companies Routes
  # get 'resources',                to: "companies#show"
  
  ## Customed Devise Routes
  devise_for  :users, 
              :skip => [:sessions, :registrations],
              controllers: {omniauth_callbacks: "omniauth_callbacks"}

  devise_scope :user do
    get    "login",               to: "devise/sessions#new",            as: :new_user_session
    post   "login",               to: "devise/sessions#create",         as: :user_session
    delete "logout",              to: "devise/sessions#destroy",        as: :destroy_user_session
 
    get    "register",            to: "devise/registrations#new",       as: :new_user_registration
    post   "register",            to: "devise/registrations#create",    as: :user_registration
    get    "account/delete",      to: "devise/registrations#cancel",    as: :cancel_user_registration

    get    "user/profile/edit",   to: "devise/registrations#edit",      as: :edit_user_registration
    
    patch  "user",                to: "devise/registrations#update"
    put    "user",                to: "devise/registrations#update"
    put    "register",            to: "devise/registrations#update"
    delete "user/delete",         to: "devise/registrations#destrony"

    get    "user/profile",        to: 'devise/registrations#edit',      as: :user_root
  end

end