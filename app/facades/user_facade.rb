class UserFacade
  def self.get_favorite_stations(user_token)
    favorite_stations = UserService.get_favorite_stations(user_token)
    if favorite_stations[:errors]
      favorite_stations = []
    else
      favorite_stations[:data].map do |station|
        Station.new(station[:attributes])
      end
    end
  end
end
