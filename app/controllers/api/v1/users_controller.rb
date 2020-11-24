class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate_request, only: :create


    def create
        @user = User.create_user(create_users_params)
        
        begin
            if @user.valid?
                # token = encode_token({user_id: @user.id})
                # token = JsonWebToken.encode(user_id: user.id)
                # render json: {success: 'Successfully registered', data:{user: @user, token: token}}
                render json: {success: 'Successfully registered', user: @user}
            else
                render json: {error: true, errors: ['Invalid username or password']}
            end
        rescue Exception => error
            render json: {error: true, errors: [error.message]}
        end
    end

    def update
        @user = User.find(params[:id])
        begin
            # @user.send(params[:method].to_sym)
            user = @user.update_user(params[:user])
            render json: {success: 'User information successfully updated', user: user}
        rescue Exception => error
            render json: {error: true, errors:[error.message]}
        end
    end

    def show
        @user = User.find(params[:id])
        render json: {user: @user}
    end

    def reset_password
        user = User.find(params[:user_id])
        begin
            user.password = params[:new_password] if params[:new_password]
            user.password_confirmation = params[:password_confirmation] if params[:password_confirmation]
            
            user.save!
            render json: {success: 'Password reset successful', user: user}
        rescue Exception => error
            render json: {error: true, errors:[error.message]}
        end
    end

    private

    def create_users_params
        params.require(:user).permit(:firstName, :middleName, :lastName, :email, :phone_number, :password, :password_confirmation)
    end
end