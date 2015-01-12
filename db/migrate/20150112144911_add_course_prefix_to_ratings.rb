class AddCoursePrefixToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :prefix, :string
  end
end
