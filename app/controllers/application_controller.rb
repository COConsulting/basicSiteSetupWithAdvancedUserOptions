class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :store_location
  before_action :configure_permitted_parameters, if: :devise_controller?

  #################################################################
  ## Start section for Redirect to Previous Page on Login/Logout ##
  #################################################################

  def store_location
    return unless request.get? 
    if (request.path != "/login" &&
        request.path != "/logout" &&
        request.path != "/register" &&
        !request.path.start_with?("/admin", "/users", "/user") &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  protected

  def after_sign_in_path_for(resource)
   session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

  #################################################################
  ##  End section for Redirect to Previous Page on Login/Logout  ##
  #################################################################

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :birthday
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:sign_up) << :email
    devise_parameter_sanitizer.for(:sign_in) << :login
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