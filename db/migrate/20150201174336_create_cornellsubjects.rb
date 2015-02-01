class CreateCornellsubjects < ActiveRecord::Migration
  def change
    create_table :cornellsubjects do |t|
      t.string :prefix

      t.timestamps null: false
    end
  end
end
