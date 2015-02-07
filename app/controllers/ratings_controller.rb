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
    # Append courseid to each rating    
    @cornell_classes = Cornellclass.where("UPPER(prefix) = UPPER(?) AND coursenumber = ?", rating_params[:prefix].strip, rating_params[:course_number].strip)
    @cornell_classes.each do |cornell_class| 
      # cornell_class is a single class
      with_id_params = rating_params
      with_id_params[:courseid] = cornell_class.courseid
      # Append user_id to each rating
      @rating = current_user.ratings.build(with_id_params)
      @rating.save
      @rating.format      
      # Aggregate data calculation      
      # Context calculation
      cornell_class.countratings 
      # Boolean avg calculation ## Must be above others
      # because numerical calc functions depend on bools
      cornell_class.calchwyesno
      cornell_class.calcrecitationreqdyesno
      cornell_class.calcexamyesno
      cornell_class.calclecturereqdyesno
      cornell_class.calcprojyesno      
      cornell_class.calcprelimyesno    
      # Quality avg calculation
      cornell_class.calcavgrating
      cornell_class.calcprofqual
      cornell_class.calctaqual
      cornell_class.calclecturequal
      cornell_class.calcrecitationqual
      # Difficulty avg calculation
      cornell_class.calchwdiff
      cornell_class.calcexamdiff
      cornell_class.calcmaterialdiff
      cornell_class.calcprojdiff
      cornell_class.calcprelimdiff      
    end
    respond_with(@rating)
    redirect_to (:back), notice: "No class found with that prefix and number" if @cornell_classes.first.nil?
  end

  def update
    @rating.update(rating_params)
    respond_with(@rating)
  end

  def destroy
    @rating.destroy
    #respond_with(@rating)
    redirect_to userratings_path, notice: "Your rating was successfully deleted."
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
      params.require(:rating).permit(:rater, :rating, :created_at, :updated_at, :prefix, :course_number, :hwyesno, :recitationreqdyesno, :examyesno, :lecturereqdyesno, :projyesno, :profqual, :taqual, :lecturequal, :recitationqual, :hwdiff, :examdiff, :materialdiff, :projdiff, :prelimyesno, :prelimdiff, :semester)
    end
end
