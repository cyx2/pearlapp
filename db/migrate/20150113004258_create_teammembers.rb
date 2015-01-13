class CreateTeammembers < ActiveRecord::Migration
  def change
    create_table :teammembers do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :quote
      t.string :quoted_person

      t.timestamps null: false
    end
  end
end
