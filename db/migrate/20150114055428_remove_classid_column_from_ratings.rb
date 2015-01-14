class RemoveClassidColumnFromRatings < ActiveRecord::Migration
  def change
  	remove_column :ratings, :classid
  end
end
