class UsersController < ApplicationController
  def index
    @users = User.order_by([:last_activity_at.desc, :name.asc])
  end

  def show
    @user = User.find_by(:nickname => params[:nickname])
  end
end
