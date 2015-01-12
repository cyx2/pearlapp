class AddCourseNumberToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :course_number, :integer
  end
end
