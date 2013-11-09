class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user

  def set_user
    return if session[:user_id].blank?
    @current_user = User.find_by(id: session[:user_id])
  end

  def current_user
    @current_user ||= set_user
  end
end
