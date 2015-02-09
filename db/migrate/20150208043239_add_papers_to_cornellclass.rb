class AddPapersToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :paperyesno, :boolean
    add_column :cornellclasses, :paperdiff, :float
  end
end
