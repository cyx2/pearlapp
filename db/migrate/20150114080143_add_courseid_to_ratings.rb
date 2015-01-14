class AddCourseidToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :courseid, :integer
    add_index :ratings, :courseid
  end
end
