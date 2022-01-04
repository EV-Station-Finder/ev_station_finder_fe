class FavoriteStationsController < ApplicationController
  def create
    # guest users without session token will be redirected to the root path by the authorize method
    StationFacade.add_favorite_station(params[:api_id], session[:token])
    flash[:notice] = "#{params[:station_name]} has been added to your favorite stations"
    redirect_to station_path(params[:api_id])
  end
  
  def destroy
    # guest users without session token will be redirected to the root path by the authorize method
    StationFacade.remove_favorite_station(params[:api_id], session[:token])
    flash[:notice] = "#{params[:station_name]} has been removed from your favorite stations"
    redirect_to station_path(params[:api_id])
  end
end
