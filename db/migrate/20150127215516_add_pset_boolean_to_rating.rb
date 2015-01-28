class AddPsetBooleanToRating < ActiveRecord::Migration
  def change
  	add_column :ratings, :hwyesno, :boolean
  end
end
