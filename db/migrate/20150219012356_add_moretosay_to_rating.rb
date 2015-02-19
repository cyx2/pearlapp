class AddMoretosayToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :moretosay, :text
  end
end
