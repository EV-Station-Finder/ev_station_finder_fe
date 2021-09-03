class StationsController < ApplicationController
  def index
    @stations = StationsFacade.get_stations(params[:location])
  end
end
