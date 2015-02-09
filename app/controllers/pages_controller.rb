class PagesController < ApplicationController
  def home  	
  	if user_signed_in?
  		@lastratings=Rating.last(5)
  		@userlastratings=current_user.ratings.last(5)
  		@count=Cornellclass.where("avgrating >= ?", 1).count
      if @count > 5
        @count=5
      end
  		@highestratedclasses=Cornellclass.where("avgrating >= ?", 1).order("avgrating DESC").take(@count)
  	end
  end
  
  def team
  end
end
