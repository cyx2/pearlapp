class AddCornellClassIdToCornellClass < ActiveRecord::Migration
  def change
    add_column :cornell_classes, :cornell_class_id, :integer
  end
end
