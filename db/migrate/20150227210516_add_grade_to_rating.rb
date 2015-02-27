class AddGradeToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :grade, :integer
  end
end
