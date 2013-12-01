class UsersController < ApplicationController
  respond_to :json, :html

  def index
    @users = User.order_by([:last_activity_at.desc, :name.asc])
    respond_with(@users)
  end

  def show
    @user = User.find_by(:nickname => params[:nickname])
  end

  def search
    @users = User.where(:nickname => /^#{params[:term]}.*/).map(&:nickname)
    respond_with(@users)
  end
end
