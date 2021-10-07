class SignUpController < ApplicationController
  def new
  end
  
  def create
    user = UserFacade.create_user(user_params)
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path(user.id)
    else
      flash[:error] = user[:errors]
      render :new
    end
  end
  
  private
  
  def user_params
    permitted_params = params.permit(:first_name, :last_name, :email, :street_address, :city, :state, :zip_code, :password)
    permitted_params.to_h || {}
  end
end


