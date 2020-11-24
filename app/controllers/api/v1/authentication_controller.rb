require 'security/json_web_token'

class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
   
    def authenticate
      command = Api::V1::AuthenticateUser.call(params[:email], params[:password])
   
      if command.success?
        auth = command.result
        # render json: { auth_token: command.result }
        render json: { auth_token: auth[:token], user: auth[:user], age: Security::JsonWebToken.expiry }
      else
        # render json: { error: command.errors }, status: :unauthorized
        render json: { error: true, errors: [command.errors] }

      end
    end
   end