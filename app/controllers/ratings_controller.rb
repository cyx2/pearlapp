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
    @ratings = current_user.ratings
    respond_with(@ratings)
  end

  def show
    respond_with(@rating)
  end

  def new
    @coursenumber=params[:course_number]
    @prefix=params[:prefix]
    # Append user_id to each rating
    @rating = current_user.ratings.build
    respond_with(@rating)
  end

  def edit
  end

  def create

    # If no search text present, user made an error at general rating page or they are rating from the view class page
    if !rating_params[:search_text].present?

      # This checks to see if the prefix and course_number are present.  If rating from the view class page, it should be present.
      if rating_params[:prefix].present? && rating_params[:course_number].present?
        # Append user_id to each rating
        @rating = current_user.ratings.build(rating_params)
        @rating.save
        @rating.format

        @cornell_classes = Cornellclass.where("UPPER(prefix) = UPPER(?) AND coursenumber = ?", rating_params[:prefix], rating_params[:course_number])
        @cornell_classes.each do |cornell_class|
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
          cornell_class.calcpaperyesno 
          cornell_class.calclabyesno
          # Numerical calculation
          cornell_class.calculate

          current_user.incNumratings
          
          respond_with(@rating) unless @cornell_classes.nil?    
          redirect_to (:back), notice: "No class found with that prefix and number" if @cornell_classes.nil?
        end
      else
        redirect_to (:back), notice: "No class prefix or number entered"
      end

    # If the user is rating from the general rate page and there is search text
    else
      # Append courseid to each rating
      search_text = rating_params[:search_text]
      if (search_text.include?(':') && (search_text.split(': ')).length == 2)
        parsed_search = search_text.split(': ')
        prefix = parsed_search.first.split(' ').first
        coursenumber = parsed_search.first.split(' ').last
        freeform = search_text.last
        @cornell_classes = Cornellclass.where("UPPER(prefix) = UPPER(?) AND coursenumber = ?", prefix, coursenumber)
        @cornell_classes.each do |cornell_class| 
          # cornell_class is a single class
          with_id_params = rating_params
          with_id_params.delete :search_text
          with_id_params[:prefix] = prefix
          with_id_params[:course_number] = coursenumber
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
          cornell_class.calcpaperyesno 
          cornell_class.calclabyesno
          # Numerical calculation
          cornell_class.calculate

          current_user.incNumratings

          respond_with(@rating) unless @cornell_classes.first.nil?    
          redirect_to (:back), notice: "No class found with that prefix and number" if @cornell_classes.first.nil?
        end
      end

    # End of main logic loop
    end

  # End of method 
  end

  def update
    without_search_param = rating_params
    without_search_param.delete :search_text
    @rating.update(without_search_param)
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
      params.require(:rating).permit(:rater, :rating, :created_at, :updated_at, :prefix, 
        :course_number, :search_text, :hwyesno, :recitationreqdyesno, :examyesno, 
        :lecturereqdyesno, :projyesno, :profqual, :taqual, :lecturequal, :recitationqual, 
        :hwdiff, :examdiff, :materialdiff, :projdiff, :prelimyesno, :prelimdiff, :semester, 
        :paperyesno, :paperdiff, :moretosay, :labreqdyesno, :labqual, :grade)
    end
end
