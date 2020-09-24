class WelcomeController < ApplicationController


    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
        @universities = University.top_three
    end

end