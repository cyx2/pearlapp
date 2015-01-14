class AddCourseidToCornellclasses < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :courseid, :integer
    add_index :cornellclasses, :courseid
  end
end
