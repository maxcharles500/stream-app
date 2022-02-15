class UsersController < ApplicationController 
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    def index
        users = User.all
        render json: users
    end 
    def show 
        user = User.find(params[:id])
        render json: user 
    end
    def create 
        new_user = User.new(user_params)
        if new_user.save 
        render json: new_user, status: :created
        else 
            render json: {error:new_user.errors.full_messages}, status: :unprocessable_entity 
        end
        
    end 

    private 

    def user_params 
       params.permit(:name, :email, :password, :username, :address, :phone)
    end


end
# User Table
# 		—  User Class
# 		—  Columns:
# 			—  ID (int)
# 			—  Username(str)
# 			—  Password(str)
# 			—  Email  (str)
# 			—  Address  (str)
# 			—  Name (str)
# 			—  Phone (str)