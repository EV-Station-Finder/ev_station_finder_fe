class UsersController < ApplicationController
  skip_before_action :authorize, only: %i[create new]

  def new
  end

  def create
    user = UserService.create_user(user_params)
    if user[:data]
      session[:token] = user[:data][:token]
      redirect_to dashboard_path
    else
      flash[:errors] = user[:errors]
      render :new
    end
  end

  private

  def user_params
    permitted_params = params.permit(:first_name, :last_name, :email, :street_address, :city, :state, :zip_code, :password)
    permitted_params.to_h || {}
  end
end
