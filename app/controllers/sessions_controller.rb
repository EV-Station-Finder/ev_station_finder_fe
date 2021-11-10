class SessionsController < ApplicationController
  def create
    user = UserService.log_in_user(user_params)
    if user[:data]
      session[:token] = user[:data][:token]
      redirect_to dashboard_path
    else
      flash[:errors] = user[:errors]
      redirect_to root_path
    end
  end

  private

  def user_params
    permitted_params = params.permit(:email, :password)
    permitted_params.to_h || {}
  end
end
