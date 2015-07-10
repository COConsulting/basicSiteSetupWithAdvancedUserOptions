class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def previous_page
    ## These do not work. When used I get the following error: No route matches [GET] "/user.1"
    ## Unable to figure out what is requesting the GET route to "/user.1". I have never used that syntax.
    ## The '1' is a dynamic variable from the logging in user's id. So, where is the code written? Where is it being called?

    # previous_page = request.env["HTTP_REFERER"]
    # request.env["HTTP_REFERER"]
    # return
   
    ## These all work fine. Is it because they are static pages?
     '/'
    # '/about'
    # 'http://www.google.com'
  end


  ## Overwrites the derauls :user_root from the routes.rb file. 
  ## So, instead of sending the user to their profile page, it sends them to whatever previous_page is set at.
  # def after_sign_in_path_for(resource)
  #  edit_user_registration_path(resource) 
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :birthday
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :birthday
    devise_parameter_sanitizer.for(:account_update) << :address_1
    devise_parameter_sanitizer.for(:account_update) << :address_2
    devise_parameter_sanitizer.for(:account_update) << :city
    devise_parameter_sanitizer.for(:account_update) << :state
    devise_parameter_sanitizer.for(:account_update) << :zip_code
    devise_parameter_sanitizer.for(:account_update) << :facebook
    devise_parameter_sanitizer.for(:account_update) << :twitter
    devise_parameter_sanitizer.for(:account_update) << :google_plus
    devise_parameter_sanitizer.for(:account_update) << :instagram
    devise_parameter_sanitizer.for(:account_update) << :pinterest
  end
end

