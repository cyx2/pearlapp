class AddClassIdToCornellClass < ActiveRecord::Migration
  def change
    add_column :cornell_classes, :class_id, :integer
  end
end
