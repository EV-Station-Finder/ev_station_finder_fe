class StationsController < ApplicationController
  def index
    @stations = StationFacade.get_stations(params[:location])
  end

  def show
    @station = StationFacade.get_station(params[:id])
  end
end
