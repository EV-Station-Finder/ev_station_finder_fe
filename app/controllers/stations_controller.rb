class StationsController < ApplicationController
  def index
    @stations = StationFacade.get_stations(params[:location])
  end
end
