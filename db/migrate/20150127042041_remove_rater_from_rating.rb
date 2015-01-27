class RemoveRaterFromRating < ActiveRecord::Migration
  def change
  	remove_column :ratings, :rater
  end
end
