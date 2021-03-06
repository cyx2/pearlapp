class PagesController < ApplicationController
  def home  	
  	if user_signed_in?
  		@c1=Cornellclass.where("numratings >= ?", 1).count
      if @c1 > 5
        @c1=5
      end
      @c2=Cornellclass.where("avgrating >= ?", 1).count
      if @c2 > 5
        @c2=5
      end

      @lastratings=Cornellclass.where("numratings >= ?", 1).order("numratings DESC").take(@c1)
      @userlastratings=current_user.ratings.order("created_at DESC").first(5)
  		@highestratedclasses=Cornellclass.where("avgrating >= ? AND numratings > ?", 1, 1).order("avgrating DESC").take(@c2)
  	end
  end
  
  def team
  end

  def mostrated
    @cornellclasses=Cornellclass.where("numratings >= ?", 1).order("numratings DESC").take(25)
  end

  def highestrated
    @cornellclasses=Cornellclass.where("avgrating >= ? AND numratings > ?", 1, 1).order("avgrating DESC").take(25)
  end

  def help
  end

end
