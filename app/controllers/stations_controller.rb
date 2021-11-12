class StationsController < ApplicationController
  skip_before_action :authorize, only: %i[index show]

  def index
    @stations = StationFacade.get_stations(params[:location])
  end

  def show
    @station = StationFacade.get_station(params[:id])
  end
end
