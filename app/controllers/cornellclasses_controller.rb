class CornellclassesController < ApplicationController
  before_action :set_cornellclass, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornellclasses = Cornellclass.all.paginate(:page => params[:page], :per_page => 250)
    respond_with(@cornellclasses)
  end

  def search_results    
    @search_results = Cornellclass.where("coursenumber = ? OR lower(title) LIKE '%' || lower(?) || '%' OR lower(instructor) LIKE '%' || lower(?) || '%' OR courseid = ?", params[:search_text], params[:search_text], params[:search_text], params[:search_text])
    respond_with(@search_results)
  end

  def show
    respond_with(@cornellclass)
  end

  def new
    # Pulls all course data for specified year, based on subject list
    subjectdoc= Nokogiri.XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/xml/"))
    # Reads each subject and stores it in local variable prefix
    subjectdoc.xpath("//subject/@subject").each do |prefix|
      # Link to course pages, substituting in prefix in URL
      classdoc= Nokogiri.XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/#{prefix}/xml/"))
      # Reads each course and stores listed vars
      classdoc.xpath("/courses/course").each do |course|
        num = course["catalog_nbr"] || "Not provided"
        subj = course["subject"]    || "Not provided"
        title = (course.at("course_title/text()") || "Not provided").to_s
        cid = (course.at("sections/section/@class_number") || "Not provided").to_s
        inst = (course.at("sections/section/meeting/instructors/instructor/text()") || "Not provided").to_s
        # Creates a cornell class in Cornellclasses table
        Cornellclass.create(:prefix => subj, :coursenumber => num, :instructor => inst, :title => title, :courseid => cid)
      end
    end
    #@cornellclass = Cornellclass.new
  end

  def edit
  end

  def create
    @cornellclass = Cornellclass.new(cornellclass_params)
    @cornellclass.save
    respond_with(@cornellclass)
  end

  def update
    @cornellclass.update(cornellclass_params)
    respond_with(@cornellclass)
  end

  def destroy
    @cornellclass.destroy
    respond_with(@cornellclass)
  end

  def userratings
  end

  private
    def set_cornellclass
      @cornellclass = Cornellclass.find(params[:id])
    end

    def cornellclass_params
      params.require(:cornellclass).permit(:title, :prefix, :coursenumber, :courseid, :avgrating, :numratings, :created_at, :updated_at)
    end
end
