class UniversitiesController < ApplicationController

    def new
        @university = University.new
    end

    def create
        @university = University.new(university_params)
        if @university.save
            redirect_to universities_path
        else
            render 'new'
        end
    end

    def index
        if params[:search]
            searched_name = params[:search]
            @universities = University.by_name(searched_name)
                # .where('name LIKE ?', "%#{params[:search]}%")
            else
            @universities = University.all
            end
    end

    def show
        @university = University.find_by(id: params[:id])
        if !@university
            redirect_to universities_path
            return
        end
    end

    private

    def university_params
        params.require(:university).permit(:name, :address)
      end

end