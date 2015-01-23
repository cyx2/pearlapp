class CornellclassesController < ApplicationController
  before_action :set_cornellclass, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornellclasses = Cornellclass.all.paginate(:page => params[:page], :per_page => 250)
    respond_with(@cornellclasses)
  end

  def show
    respond_with(@cornellclass)
  end

  def new
    # Pulls all course data for specified year, based on subject list
    doc1= Nokogiri.XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/xml/"))
    doc1.xpath("//subject/@subject").each do |prefix|
      doc2= Nokogiri.XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/#{prefix}/xml/"))
      doc2.xpath("/courses/course").each do |course|
        num = course["catalog_nbr"] || "N/A"  # in case it doesn't exist
        subj = course["subject"]     || "N/A"  # in case it doesn't exist
        title = (course.at("course_title/text()") || "N/A").to_s
        cid = (course.at("sections/section/@class_number") || "N/A").to_s
        inst = (course.at("sections/section/meeting/instructors/instructor/text()") || "N/A").to_s
        Cornellclass.create(:prefix => subj, :coursenumber => num, :instructor => inst, :title => title, :courseid => cid)
      end
    end
    #@cornellclass = Cornellclass.new
    redirect_to cornellclasses_path, notice: "Courses successfully pulled."
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
