class AddSemesterToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :semester, :string
  end
end
