class CornellsubjectsController < ApplicationController
  before_action :set_cornellsubject, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:new, :show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornellsubjects = Cornellsubject.all
    respond_with(@cornellsubjects)
  end

  def show
    respond_with(@cornellsubject)
  end

  def new
    sdoc = Nokogiri::XML(open("https://courseroster.reg.cornell.edu/courses/roster/SP15/xml/"))
    sdoc.xpath("/subjects/subject").each do |s|
      pref = s["subject"]
      na=s["subject_ldescr"]
      Cornellsubject.create(:prefix => pref, :name => na)      
    end
    @cornellsubject = Cornellsubject.new
  end

  def edit
  end

  def create
    @cornellsubject = Cornellsubject.new(cornellsubject_params)
    @cornellsubject.save
    respond_with(@cornellsubject)
  end

  def update
    @cornellsubject.update(cornellsubject_params)
    respond_with(@cornellsubject)
  end

  def destroy
    @cornellsubject.destroy
    respond_with(@cornellsubject)
  end

  private
    def set_cornellsubject
      @cornellsubject = Cornellsubject.find(params[:id])
    end

    def verify_user
      redirect_to cornellsubjects_path, notice: "You're not authorized to edit the subjects at Cornell!" unless current_user.id == 1
    end

    def cornellsubject_params
      params.require(:cornellsubject).permit(:prefix)
    end
end
