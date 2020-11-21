require 'security/json_web_token'

class Api::V1::AuthenticateUser
    prepend SimpleCommand
  
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      _user = user
      {token: Security::JsonWebToken.encode(user_id: _user.id), user: _user} if _user
    end
  
    private
  
    attr_accessor :email, :password
  
    def user
      user = User.find_by_email(email)
      return user if user && user.authenticate(password)
  
      errors.add :user_authentication, 'invalid credentials'
      nil
    end

  end