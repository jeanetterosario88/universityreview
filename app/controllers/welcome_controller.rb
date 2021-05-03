class WelcomeController < ApplicationController
skip_before_action :require_login, only: [:index]

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
        @universities = University.top_three
    end

end