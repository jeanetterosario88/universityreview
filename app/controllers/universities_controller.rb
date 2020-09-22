class UniversitiesController < ApplicationController

    def index
        if !params[:sort].blank?
            @universities = University.all.sort_by do |university|
            university.average_score
            end
        else 
            @universities = University.all
        end
    end

    def new
        @university = University.new
    end

    def create
        if university = University.create(university_params)
            redirect_to universities_path
        else
            render 'new'
        end
    end

    def show
        @university= University.find_by(id: params[:id])
    end

    private

    def university_params
        params.require(:university).permit(:name, :address)
      end

end