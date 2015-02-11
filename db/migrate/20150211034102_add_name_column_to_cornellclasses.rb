class AddNameColumnToCornellclasses < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :name, :string
  end
end
