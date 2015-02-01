class CornellsubjectsController < ApplicationController
  before_action :set_cornellsubject, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornellsubjects = Cornellsubject.all
    respond_with(@cornellsubjects)
  end

  def show
    respond_with(@cornellsubject)
  end

  def new
    doc = Nokogiri::HTML(open("https://courseroster.reg.cornell.edu/courses/roster/FA14/xml/"))
    doc.xpath("//subject/@subject").each do |prefix|
      Cornellsubject.create(:prefix => prefix)      
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

    def cornellsubject_params
      params.require(:cornellsubject).permit(:prefix)
    end
end
