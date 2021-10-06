class User
  attr_reader :email,
              :street_address,
              :city,
              :state,
              :zip_code

  def initialize(user_data)
    @email = user_data[:email]
    @street_address = user_data[:street_address]
    @city = user_data[:city]
    @state = user_data[:state]
    @zip_code = user_data[:zip_code]
  end
end

