class RemoveCornellClassIdToCornellClass < ActiveRecord::Migration
  def change
  	remove_column :cornell_classes, :class_id
  end
end
