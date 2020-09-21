class SessionsController < ApplicationController

    def new
    end

    def create
        if @user = User.find_by(username: params[:username])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end