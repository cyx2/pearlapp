class AddPrelimQuestionsToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :prelimyesno, :boolean
    add_column :ratings, :prelimdiff, :float
  end
end
