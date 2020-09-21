class UniversitiesController < ApplicationController

    def index
        @universities = University.all 
    end

    def new
        @university = University.new
    end

    def create
        university = University.create(university_params)
        redirect_to university_path
    end

    def university_params
        params.require(:university).permit(
          :name,
          addresses_attributes: [
            :street_address_1,
            :street_address_2,
            :city,
            :state,
            :zipcode,
          ]
        )
      end

end