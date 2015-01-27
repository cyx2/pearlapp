class AddHwyesnoToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :hwyesno, :boolean
  end
end
