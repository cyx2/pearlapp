class DropColumnCourseidFromCornellclasses < ActiveRecord::Migration
  def change
  	remove_column :cornellclasses, :courseid
  end
end
