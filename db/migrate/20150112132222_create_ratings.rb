class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :rater
      t.integer :rating
      t.integer :classid
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
