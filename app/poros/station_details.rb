class StationDetails
  attr_reader :name,
              :status,
              :hours,
              :ev_network,
              :street_address,
              :city,
              :state,
              :zip_code,
              :accepted_payments,
              :hourly_weather

  def initialize(station_data)
    @name              = station_data[:name]
    @status            = station_data[:status]
    @hours             = station_data[:hours]
    @ev_network        = station_data[:ev_network]
    @street_address    = station_data[:street_address]
    @city              = station_data[:city]
    @state             = station_data[:state]
    @zip_code          = station_data[:zip_code]
    @accepted_payments = station_data[:accepted_payments]
    @hourly_weather    = station_data[:hourly_weather]
  end
end