class AddLabToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :labreqdyesno, :boolean
    add_column :cornellclasses, :labqual, :float
  end
end
