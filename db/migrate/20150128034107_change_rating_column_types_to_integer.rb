class ChangeRatingColumnTypesToInteger < ActiveRecord::Migration
  def change
  	change_column :ratings, :prelimdiff, :integer
  	change_column :ratings, :profqual, :integer
  	change_column :ratings, :taqual, :integer
  	change_column :ratings, :lecturequal, :integer
  	change_column :ratings, :recitationqual, :integer
  	change_column :ratings, :hwdiff, :integer
  	change_column :ratings, :examdiff, :integer
  	change_column :ratings, :materialdiff, :integer
  	change_column :ratings, :projdiff, :integer
  end
end
