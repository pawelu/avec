class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_initialize_by(basic_user_attributes(auth))
    user.assign_attributes(extra_user_attributes(auth))

    user.save!

    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  protected

    def basic_user_attributes(auth)
      {
        provider: auth['provider'],
        uid: auth['uid'],
        nickname: auth['info']['nickname']
      }
    end

    def extra_user_attributes(auth)
      {
        avatar: auth['info']['image'],
        email: auth['info']['email'],
        name: auth["info"]["name"]
      }
    end
end
