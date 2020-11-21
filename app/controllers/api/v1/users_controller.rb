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
            @user.send(params[:method].to_sym)
            render json: {success: 'User information successfully updated'}
        rescue Exception => error
            render json: {error: true, errors:[error.message]}
        end
    end

    def show
        @user = User.find(params[:id])
        render json: {user: @user}
    end

    # def login
    #     @user = User.find_by_email(params[:email])

    #     if @user.status == 1
    #         render json: {error: true, errors: ["Account is blocked, please refer to admin to ublock your account!"]}
    #     elsif @user && @user.authenticate(params[:password])
    #         token = encode_token({user_id: @user.id})
    #         result = {
    #             user: @user.slice(:id, :first_name, :middle_name, :last_name, :email, :phone_number),
    #             token: token
    #         }

    #         render json: {'You are successfully logged in', user: result}
    #     else
    #         render json: {error: true,  errors:["Invalid username or password"]}
    #     end

    # end

    # def auto_login
    #     render json:{user: @user}
    # end


    private

    def create_users_params
        params.require(:user).permit(:firstName, :middleName, :lastName, :email, :phone_number, :password, :password_confirmation)
    end
end