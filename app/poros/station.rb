class Station
  attr_reader :api_id,
              :name,
              :distance,
              :status,
              :hours,
              :ev_network,
              :street_address,
              :city,
              :state,
              :zip_code,
              :is_favorited

  def initialize(station_data)
    @api_id         = station_data[:api_id]
    @name           = station_data[:name]
    @distance       = station_data[:distance]
    @status         = station_data[:status]
    @hours          = station_data[:hours]
    @ev_network     = station_data[:ev_network]
    @street_address = station_data[:street_address]
    @city           = station_data[:city]
    @state          = station_data[:state]
    @zip_code       = station_data[:zip_code]
    @is_favorited   = station_data[:is_favorited]
  end
end