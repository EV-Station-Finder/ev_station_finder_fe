class DashboardsController < ApplicationController
  def show
    @user = UserService.get_user(session[:token])
    user_address = "#{@user.street_address} #{@user.city}, #{@user.state} #{@user.zip_code}"
    @nearest_stations = StationFacade.get_stations(user_address)
    @favorite_stations = UserFacade.get_favorite_stations(session[:token])
  end
end