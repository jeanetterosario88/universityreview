class ReviewsController < ApplicationController

    def index
      @universities = University.all
      if !params[:university].blank?
        @reviews = Review.by_university(params[:university])
      else
        @reviews = Review.all
      end
    end
  
    def show
      if params[:university_id]
        @review = University.find(params[:university_id]).reviews.find(params[:id])
      else
        @review = Review.find(params[:id])
      end
    end
  
    def new
      if params[:university_id] && !University.exists?(params[:university_id])
        redirect_to universitys_path, alert: "University not found."
      else
        @review = Review.new(university_id: params[:university_id])
      end
    end
  
    def create
      @review = Review.new(review_params)
      @review.save
      redirect_to review_path(@review)
    end
  
    def update
      @review = Review.find(params[:id])
      @review.update(params.require(:review))
      redirect_to review_path(@review)
    end
  
    def edit
      if params[:university_id]
        university = University.find_by(id: params[:university_id])
        if university.nil?
          redirect_to universities_path, alert: "University not found."
        else
          @review = university.reviews.find_by(id: params[:id])
          redirect_to university_reviews_path(university) if @review.nil?
        end
      else
        @review = Review.find(params[:id])
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:title, :content, :score)
    end
  end
  