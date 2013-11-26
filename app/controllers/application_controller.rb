class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user
  before_action :update_last_activity_at

  private

    def set_user
      return if session[:user_id].blank?
      @current_user = User.find_by(id: session[:user_id])
    end

    def current_user
      @current_user ||= set_user
    end
    helper_method :current_user

    def update_last_activity_at
      current_user.update_last_activity_at if current_user
    end
end
