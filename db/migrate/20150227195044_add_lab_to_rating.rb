class AddLabToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :labreqdyesno, :boolean
    add_column :ratings, :labqual, :integer
  end
end
