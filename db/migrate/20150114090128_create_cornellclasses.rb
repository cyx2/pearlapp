class CreateCornellclasses < ActiveRecord::Migration
  def change
    create_table :cornellclasses do |t|
      t.string :title
      t.string :prefix
      t.integer :coursenumber
      t.integer :courseid
      t.float :avgrating
      t.integer :numratings
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
