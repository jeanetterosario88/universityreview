class SessionsController < ApplicationController
skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/'
        elsif auth
            @user = User.find_by(uid: auth['uid'])
            if !@user
                @user = User.new(username: auth.info.name, email: auth.info.email, uid: auth.info.uid)
                @user.save!(validate: false)
                session[:user_id] = @user.id
                redirect_to '/'
            else
                session[:user_id] = @user.id
                redirect_to '/'
            end
        else
            flash[:error] = "We couldn't log you in. Please enter your correct username and password."
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