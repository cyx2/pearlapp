class AddAvggradeToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :avggrade, :float
  end
end
