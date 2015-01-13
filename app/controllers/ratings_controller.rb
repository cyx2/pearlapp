class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @ratings = Rating.all
    respond_with(@ratings)
  end

  def show
    respond_with(@rating)
  end

  def new
    #@rating = Rating.new
    @rating = current_user.ratings.build
    respond_with(@rating)
  end

  def edit
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    @rating.save
    respond_with(@rating)
  end

  def update
    @rating.update(rating_params)
    respond_with(@rating)
  end

  def destroy
    @rating.destroy
    respond_with(@rating)
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def correct_user
      @rating = current_user.ratings.find_by(id: params[:id])
      redirect_to ratings_path, notice: "You're not authorized to edit this rating" if @pin.nil?
    end

    def rating_params
      params.require(:rating).permit(:rater, :rating, :classid, :created_at, :updated_at, :prefix, :course_number)
    end
end
