class AddClassIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :cornell_class_id, :integer
    add_index :ratings, :cornell_class_id
  end
end
