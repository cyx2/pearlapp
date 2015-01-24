class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    if current_user.id == 1
      @ratings = Rating.all.order("created_at DESC")
      respond_with(@ratings)
    else
      redirect_to userratings_path, notice: "Don't try to see other people's ratings!" unless current_user.id == 1
    end
  end

  def userratings
    @ratings = Rating.all.order("created_at DESC")
    respond_with(@ratings)
  end

  def show
    respond_with(@rating)
  end

  def new
    # Append user_id to each rating
    @rating = current_user.ratings.build
    respond_with(@rating)
  end

  def edit
  end

  def create
    # Append user_id to each rating
    @cornell_classes = Cornellclass.where("UPPER(prefix) = UPPER(?) AND coursenumber = ?", rating_params[:prefix], rating_params[:course_number])
    @cornell_classes.each do |cornell_class| 
      with_id_params = rating_params
      with_id_params[:courseid] = cornell_class.courseid
      @rating = current_user.ratings.build(with_id_params)
      @rating.save
      respond_with(@rating)
    end
    redirect_to new_rating_path, notice: "No class found with that prefix and number" if @cornell_classes.first.nil?
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

    def verify_user
      @rating = current_user.ratings.find_by(id: params[:id])
      redirect_to ratings_path, notice: "You're not authorized to interact with this rating" if @rating.nil?
    end

    def rating_params
      params.require(:rating).permit(:rater, :rating, :created_at, :updated_at, :prefix, :course_number)
    end
end
