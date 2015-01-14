class AddCourseidToCornellClasses < ActiveRecord::Migration
  def change
    add_column :cornell_classes, :courseid, :integer
  end
end
