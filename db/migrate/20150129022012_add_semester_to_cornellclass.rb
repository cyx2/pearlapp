class AddSemesterToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :semester, :string
  end
end
