class DropCornellClassesTable < ActiveRecord::Migration
  def change
  	drop_table :cornell_classes
  end
end
