class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  helper_method :sort_column, :sort_direction

  def dashboard
  end

  def moderate_users
      @users = User.order(sort_column + " " + sort_direction)
  end

  def moderate_events
  end

  def moderate_event_items
  end

  def moderate_companies
  end

  def moderate_locations
  end

  def moderate_stories
  end

  private
  
    def check_user
      if current_user.security_level != 5
        redirect_to root_url, alert: "I am sorry, but that page is only available for administrators."
      end
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end