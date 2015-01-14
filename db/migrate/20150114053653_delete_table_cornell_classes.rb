class DeleteTableCornellClasses < ActiveRecord::Migration
  def change
  	drop_table :cornell_classes
  end
end
