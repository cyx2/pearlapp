class AddPositionToTeammember < ActiveRecord::Migration
  def change
    add_column :teammembers, :position, :string
  end
end
