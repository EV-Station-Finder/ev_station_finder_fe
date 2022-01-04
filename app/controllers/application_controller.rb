class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  
  def catch_all
    redirect '/'
  end

  private

  def authorize
    response = UserService.authorize_user(session[:token])
    if response[:errors] || response[:data][:token] != session[:token]
      redirect_to root_path, notice: 'Please Log In'
    end
  end
end
