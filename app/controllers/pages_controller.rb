class PagesController < ApplicationController

  before_action :verify_signin, only: [:mostrated, :highestrated, :screener]

  def home  
    # Logic loop to roll through this code only if user is signed in	
  	if user_signed_in?
  		@c1=Cornellclass.where("numratings >= ?", 1).count
      if @c1 > 5
        @c1=5
      end
      @c2=Cornellclass.where("avgrating >= ?", 1).count
      if @c2 > 5
        @c2=5
      end
      # Retrieves database information for the dashboard
      @lastratings=Cornellclass.where("numratings >= ?", 1).order("numratings DESC").take(@c1)
      @userlastratings=current_user.ratings.last(5)
  		@highestratedclasses=Cornellclass.where("avgrating >= ?", 1).order("avgrating DESC").take(@c2)
  	end
  end
  
  def team
  end

  def mostrated
    @cornellclasses=Cornellclass.where("numratings >= ?", 1).order("numratings DESC").take(25)
  end

  def highestrated
    @cornellclasses=Cornellclass.where("avgrating >= ?", 1).order("avgrating DESC").take(25)
  end

  def screener
    ### RACHEL PUT YOUR VARIABLES HERE ###
  end

  private
    def verify_signin
      redirect_to root_path, notice: "Please log in first!" unless user_signed_in?
    end
end
