class ReviewsController < ApplicationController

    def index
      if params[:author_id]
        @reviews = University.find(params[:author_id]).reviews
      else
        @reviews = Review.all
      end
    end
  
    def show
      if params[:author_id]
        @review = University.find(params[:author_id]).reviews.find(params[:id])
      else
        @review = Review.find(params[:id])
      end
    end
  
    def new
      if params[:author_id] && !University.exists?(params[:author_id])
        redirect_to authors_path, alert: "University not found."
      else
        @review = Review.new(author_id: params[:author_id])
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
      if params[:author_id]
        author = University.find_by(id: params[:author_id])
        if author.nil?
          redirect_to authors_path, alert: "University not found."
        else
          @review = author.reviews.find_by(id: params[:id])
          redirect_to author_reviews_path(author) if @review.nil?
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
  