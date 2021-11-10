class ApplicationController < ActionController::Base
  # before_action :authorize 
  # protect_from_forgery with: :exception #TODO: Study this code
  # 
  # private
  # 
  # def authorize
  #   redirect_to root_path, notice: 'Please Log In' unless User.find_by(id: session[:user_id]) #TODO Test Authorization
  # end
end
