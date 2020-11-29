class User < ApplicationRecord
    has_secure_password
    
    has_many :todos 
    has_many :projects
    has_many :clients


    def self.create_user(params)
        user = User.new

        user.first_name = params[:firstName] if params[:firstName]
        user.middle_name = params[:middleName] if params[:middleName]
        user.last_name = params[:lastName] if params[:lastName]
        user.email = params[:email] if params[:email]
        # user.phone_number = params[:phone_number] if params[:phone_number]
        user.password = params[:password] if params[:password]
        user.password_confirmation = params[:password_confirmation] if params[:password_confirmation]
        user.status = 0 # by default user is active if 1 blocked

        user.save!
        user
    end

    def update_user(params)
       
        self.first_name = params[:first_name] if(params[:first_name])
        self.middle_name = params[:middle_name] if(params[:middle_name])
        self.last_name = params[:last_name] if(params[:last_name])
        self.email = params[:email] if(params[:email])
        self.phone_number = params[:phone_number] if(params[:phone_number])

        self.save!
        self
    end

end
