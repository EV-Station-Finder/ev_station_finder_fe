class FavoriteStationsController < ApplicationController
  def create
    StationFacade.add_favorite_station(params[:api_id], session[:token])
    flash[:notice] = "#{params[:station_name]} has been added to your favorite stations"
    redirect_to station_path(params[:api_id])
  end
end
