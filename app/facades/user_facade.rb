class UserFacade
  def self.create_user(user_params)
    user = UserService.create_user(user_params)
    UserObject.new(user) #TODO - See if name can be changed to just "User" once everything is working.
  end
end