class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!
 #  before_filter :check_uri
  helper_method :current_user

 #  def check_uri
 #   url = redirect_to request.protocol + 'www.' + request.host_with_port +
 #   request.fullpath if Rails.env.to_s == 'production' &&
 #   !/^www/.match(request.host) && ENV['DEV'].nil?
 #  end

 # private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if session[:user_id]
      current_user
    else
      redirect_to '/', notice: 'Must be signed in to play.'
    end
  end
end
