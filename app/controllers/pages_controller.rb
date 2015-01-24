class PagesController < ApplicationController
  def home
  	@cornell_classes = Cornellclass.where("number = ? OR lower(name) LIKE '%' || lower(?) || '%' ", params[:search_text], params[:search_text])
  end
  
  def team
  end
end
