class AddNumratingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :numratings, :int
  end
end
