class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  
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
