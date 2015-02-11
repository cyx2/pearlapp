class CornellclassesController < ApplicationController
  before_action :set_cornellclass, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:new, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornellclasses = Cornellclass.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 1000)
    #respond_with(@cornellclasses)
  end

  def findbysubject
    @p = params[:prefix]
    @cornellclasses = Cornellclass.where(prefix: @p)
  end
  
  def search_results
    # Finds search results from page/home search form, paginates
    search_text = params[:search_text]

    if (search_text.include?(':') && (search_text.split(': ')).length == 2)
      parsed_search = search_text.split(': ')
      prefix = parsed_search.first.split(' ').first
      coursenumber = parsed_search.first.split(' ').last
      freeform = search_text.last
      @search_results = Cornellclass.where("UPPER(prefix) LIKE '%' || UPPER(?) || '%' AND coursenumber = ? AND lower(title) LIKE '%' || lower(?) || '%'", prefix, coursenumber.to_i, freeform).paginate(:page => params[:page], :per_page => 50)
      respond_with(@search_results)
    else
      prefix = ""
      coursenumber = ""
      freeform = ""

      i = 0
      n = search_text.length
      parse_pre = true
      parse_post = false
      while i < n do
        if (parse_pre && search_text[i] =~ /[A-Za-z ]/)
          prefix = prefix + search_text[i]
          puts(search_text[i])
        elsif (!parse_post && search_text[i] =~ /[0-9]/)
          parse_pre = false
          coursenumber = coursenumber + search_text[i]
        else
          parse_post = true 
          freeform = freeform + search_text[i]
        end
        i = i + 1
      end

      if (coursenumber == "" && !Cornellclass.exists?(['UPPER(prefix) = UPPER(?)', prefix.strip]))
        freeform = prefix
        prefix = ""
      else
        prefix = prefix.strip
      end
      
      @search_results = Cornellclass.where("UPPER(prefix) LIKE '%' || UPPER(?) || '%' AND (coursenumber = ? OR 0 = ?) AND (lower(title) LIKE '%' || lower(?) || '%' OR lower(instructor) LIKE '%' || lower(?) || '%')", prefix, coursenumber.to_i, coursenumber.to_i, freeform, freeform).paginate(:page => params[:page], :per_page => 50)
      respond_with(@search_results)
    end
  end

  def show
    respond_with(@cornellclass)
  end

  def new
    ############# DON'T CHANGE THIS #############
    #############################################
    ############# YOU MUST NAVIGATE AWAY FROM PAGE AFTER CLICKING ADD CLASSES #############
    jsonstring = ""
    # Pulls all course data for specified year, based on subject list
    subjectdoc= Nokogiri.XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/xml/"))
    # Reads each subject and stores it in local variable prefix
    subjectdoc.xpath("//subject/@subject").each do |prefix|
      # Link to course pages, substituting in prefix in URL
      classdoc= Nokogiri.XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/#{prefix}/xml/"))
      # Gets the semester from each sheet read
      semester = classdoc.xpath("/courses/@term").to_s
      # Reads each course and stores listed vars
      classdoc.xpath("/courses/course").each_with_index do |course, i|
        num = course["catalog_nbr"] || "Not provided"
        subj = course["subject"]    || "Not provided"
        title = (course.at("course_title/text()") || "Not provided").to_s
        cid = (course.at("sections/section/@class_number") || "Not provided").to_s
        inst = (course.at("sections/section/meeting/instructors/instructor/text()") || "Not provided").to_s
        # Creates a cornell class in Cornellclasses table
        Cornellclass.create(:prefix => subj, :coursenumber => num, :instructor => inst, :title => title, :courseid => cid, :semester => semester)
        jsonstring = jsonstring + '"' + subj + ' ' + num + ': ' + title + '",' ####### TODO: DELETE LAST COMMA #######
      end
    end

    filepath = File.join(Rails.root, 'public', 'coursesjson.json')
    File.open(filepath, "w+") do |f|
      f.truncate(0)
      f.write("[")
      f.write(jsonstring[0,jsonstring.length-1])
      f.write(']')
    end
    @cornellclass = Cornellclass.new
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

  def coursesjson
  end

  private
    def set_cornellclass
      @cornellclass = Cornellclass.find(params[:id])
    end

    def verify_user
      redirect_to cornellclasses_path, notice: "You're not authorized to edit classes!" unless current_user.id == 1
    end


    def cornellclass_params
      params.require(:cornellclass).permit(:title, :prefix, :coursenumber, :courseid, :avgrating, :numratings, :created_at, :updated_at,  :hwyesno, :recitationreqdyesno, :examyesno, :lecturereqdyesno, :projyesno, :profqual, :taqual, :lecturequal, :recitationqual, :hwdiff, :examdiff, :materialdiff, :projdiff, :prelimyesno, :prelimdiff, :semester, :paperyesno, :paperdiff)
    end
end
