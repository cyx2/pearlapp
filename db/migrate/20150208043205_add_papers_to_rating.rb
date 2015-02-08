class AddPapersToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :paperyesno, :boolean
    add_column :ratings, :paperdiff, :integer
  end
end
