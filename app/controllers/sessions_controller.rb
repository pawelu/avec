class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(omniauth_auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  protected

    def omniauth_auth
      auth = request.env['omniauth.auth']

      {
        provider: auth["provider"],
        uid: auth["uid"],
        name: auth["info"]["name"],
        nickname: auth['info']['nickname'],
        email: auth['info']['email']
      }
    end
end
