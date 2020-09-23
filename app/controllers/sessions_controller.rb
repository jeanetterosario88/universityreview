class SessionsController < ApplicationController

    def new
    end

    def create
        if @user = User.find_by(username: params[:username])
            session[:user_id] = @user.id
            redirect_to '/'
        elsif @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            session[:user_id] = @user.id
        end
        else
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private
        def auth
            request.env['omniauth.auth']
        end
end