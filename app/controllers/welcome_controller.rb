class WelcomeController < ApplicationController


    def index
     
        if session[:user_id]
            @user = User.find(session[:user_id])
        end

        @universities = University.joins(:reviews).distinct.sort_by do |university|
            university.average_score
        end.reverse.first(3)
    end

end