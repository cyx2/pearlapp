class AddCreditsToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :credits, :string
  end
end
