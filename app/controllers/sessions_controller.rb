class SessionsController < ApplicationController


  def create

    if request.env["omniauth.auth"]
      user = User.find_or_create_by(provider: request.env["omniauth.auth"].provider,uid: request.env["omniauth.auth"].uid,name: request.env["omniauth.auth"].info.nickname)
    end
    if user
      session[:user_id] = user.id
      redirect_to repos_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
