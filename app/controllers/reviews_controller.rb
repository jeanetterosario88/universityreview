class ReviewsController < ApplicationController

    def index
      @reviews = Review.by_university(params[:university_id])
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
        redirect_to universities_path, alert: "University not found."
      else
        @review = Review.new(university_id: params[:university_id])
      end
    end
  
    def create
      puts review_params
      @review = Review.new(review_params) 
      @review.save!
      redirect_to university_review_path(@review.university.id, @review.id)
    end
  
    def update
      @review = Review.find(params[:id])
      @review.update(params.require(:review).permit(:title, :content, :score))
      redirect_to university_review_path(@review.university.id, @review.id)
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
      params.require(:review).permit(:title, :content, :score).merge(
        {
          university_id: params[:university_id], 
          user_id: session[:user_id]
        }
      )
    end
  end
  