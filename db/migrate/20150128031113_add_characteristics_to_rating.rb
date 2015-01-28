class AddCharacteristicsToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :profqual, :float
    add_column :ratings, :taqual, :float
    add_column :ratings, :lecturequal, :float
    add_column :ratings, :recitationqual, :float
    add_column :ratings, :recitationreqdyesno, :boolean
    add_column :ratings, :hwdiff, :float
    add_column :ratings, :examdiff, :float
    add_column :ratings, :examyesno, :boolean
    add_column :ratings, :lecturereqdyesno, :boolean
    add_column :ratings, :materialdiff, :float
    add_column :ratings, :projyesno, :boolean
    add_column :ratings, :projdiff, :float
  end
end
