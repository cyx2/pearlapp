class RemoveCornellClassIdFromRatings < ActiveRecord::Migration
  def change
    remove_index :ratings, :cornell_class_id
    remove_column :ratings, :cornell_class_id, :integer
  end
end
