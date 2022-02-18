class DashboardsController < ApplicationController
  def show
    user = UserService.get_user(session[:token])
    @user_info = user[:data][:attributes]
    @user_address = "#{@user_info[:street_address]} #{@user_info[:city]}, #{@user_info[:state]} #{@user_info[:zip_code]}"
    @nearest_stations = StationFacade.get_stations(@user_address)
    @favorite_stations = UserFacade.get_favorite_stations(session[:token])
    @favorites = @favorite_stations.map { | station | station.api_id }
  end
end
