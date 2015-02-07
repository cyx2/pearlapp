class PagesController < ApplicationController
  def home  	
  	if user_signed_in?
  		@lastratings=Rating.last(5)
  		@userlastratings=current_user.ratings.last(5)
  		@mostratedclasses=Cornellclass.order(numratings: :desc).take(5)
  	end
  end
  
  def team
  end
end
