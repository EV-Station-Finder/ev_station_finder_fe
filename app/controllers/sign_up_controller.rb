class SignUpController < ApplicationController
  def new
  end
  
  def create
    #TODO call backend to create user
    # if password != password_confirmation
    #   render ____
    # else
    #   #@user = UserFacade.create_user(params)
    #   #redirect_to dashboard_path
    # end
  end
  
  private
  
  def user_details
    params.permit(:first_name, :last_name, :email, :street_address, :city, :state, :zip_code, :password)
  end
end


