class UserFacade
  def self.create_user(user_params)
    user = UserService.create_user(user_params)
    User.new(user)
  end
end