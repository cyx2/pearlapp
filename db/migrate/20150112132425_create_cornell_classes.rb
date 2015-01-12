class CreateCornellClasses < ActiveRecord::Migration
  def change
    create_table :cornell_classes do |t|
      t.string :title
      t.string :subject
      t.integer :number
      t.float :avgrating
      t.integer :numratings
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
