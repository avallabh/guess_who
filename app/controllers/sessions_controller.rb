class SessionsController < ApplicationController

  def index
  end

  def create

  # gets the hash of ALL INFO
  # raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by!(name: auth["info"]["name"], provider: auth["provider"], uid: auth["uid"])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'You have successfully signed in!'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'You have successfully signed out!'
  end

  def failure
    redirect_to root_path, notice: 'Authentication Failed'
  end

end
