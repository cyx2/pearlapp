class CornellClassesController < ApplicationController
  before_action :set_cornell_class, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cornell_classes = CornellClass.all
    respond_with(@cornell_classes)
  end

  def show
    respond_with(@cornell_class)
  end

  def new
    @cornell_class = CornellClass.new
    respond_with(@cornell_class)
  end

  def edit
  end

  def create
    @cornell_class = CornellClass.new(cornell_class_params)
    @cornell_class.save
    respond_with(@cornell_class)
  end

  def update
    @cornell_class.update(cornell_class_params)
    respond_with(@cornell_class)
  end

  def destroy
    @cornell_class.destroy
    respond_with(@cornell_class)
  end

  private
    def set_cornell_class
      @cornell_class = CornellClass.find(params[:id])
    end

    def cornell_class_params
      params.require(:cornell_class).permit(:title, :prefix, :course_number, :avgrating, :numratings, :created_at, :updated_at, :courseid)
    end
end
