class TeammembersController < ApplicationController
  before_action :set_teammember, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :update, :destroy]

  respond_to :html

  def index
    @teammembers = Teammember.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    respond_with(@teammembers)
  end

  def show
    respond_with(@teammember)
  end

  def new
    @teammember = Teammember.new
    respond_with(@teammember)
  end

  def edit
  end

  def create
    @teammember = Teammember.new(teammember_params)
    @teammember.save
    respond_with(@teammember)
  end

  def update
    @teammember.update(teammember_params)
    respond_with(@teammember)
  end

  def destroy
    @teammember.destroy
    respond_with(@teammember)
  end

  private
    def set_teammember
      @teammember = Teammember.find(params[:id])
    end

    def teammember_params
      params.require(:teammember).permit(:name, :email, :website, :quote, :quoted_person, :position, :image)
    end
end
