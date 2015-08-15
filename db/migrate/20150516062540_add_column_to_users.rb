class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numratings, :integer
  end
end
