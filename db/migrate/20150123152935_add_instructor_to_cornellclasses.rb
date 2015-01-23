class AddInstructorToCornellclasses < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :instructor, :string
  end
end
