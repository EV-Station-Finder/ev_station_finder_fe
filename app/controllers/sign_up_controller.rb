class SignUpController < ApplicationController
  def new
  end
  
  def create
    user = UserService.create_user(user_params)
    if user[:data]
      session[:user_id] = user[:data][:id]
      redirect_to dashboard_path(user[:data][:id])
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


