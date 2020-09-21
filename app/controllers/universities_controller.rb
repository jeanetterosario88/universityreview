class UniversitiesController < ApplicationController

    def index
        @universities = University.all 
    end

    def new
        @university = University.new
    end

end