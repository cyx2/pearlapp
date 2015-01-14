class RemoveClassidColumnFromRatings2 < ActiveRecord::Migration
  def change
  	remove_column :ratings, :class_id
  end
end
