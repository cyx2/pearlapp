class CornellclassesController < ApplicationController
  before_action :set_cornellclass, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornellclasses = Cornellclass.all
    respond_with(@cornellclasses)
  end

  def show
    respond_with(@cornellclass)
  end

  def new
    @cornellclass = Cornellclass.new
    respond_with(@cornellclass)
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

  private
    def set_cornellclass
      @cornellclass = Cornellclass.find(params[:id])
    end

    def cornellclass_params
      params.require(:cornellclass).permit(:title, :prefix, :coursenumber, :courseid, :avgrating, :numratings, :created_at, :updated_at)
    end
end
