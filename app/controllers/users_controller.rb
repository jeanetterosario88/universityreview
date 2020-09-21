class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        if user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to '/'
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
 

end