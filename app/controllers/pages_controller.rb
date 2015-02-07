class PagesController < ApplicationController
  def home  	
  	if user_signed_in?
  		@lastratings=Rating.last(5)
  		@userlastratings=current_user.ratings.last(5)
  		#@var=Cornellclass.where()
  		@var=Cornellclass.where("avgrating >= ?", 1).count
      if @var > 5
        @var=5
      end
  		@highestratedclasses=Cornellclass.order(avgrating: :desc).take(@var)
  	end
  end
  
  def team
  end
end
