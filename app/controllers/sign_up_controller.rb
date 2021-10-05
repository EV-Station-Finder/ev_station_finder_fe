class SignUpController < ApplicationController
  def new
  end
  
  def create
    #TODO call backend to create user
    # if password != password_confirmation
    #   render ____
    # else
    @user = UserFacade.create_user(user_params)
    #   #redirect_to dashboard_path(@user)
    # end
  end
  
  private
  
  def user_params
    permitted_params = params.permit(:first_name, :last_name, :email, :street_address, :city, :state, :zip_code, :password)
    permitted_params.to_h || {}
  end
end


