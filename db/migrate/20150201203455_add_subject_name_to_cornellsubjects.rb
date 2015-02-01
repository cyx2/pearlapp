class AddSubjectNameToCornellsubjects < ActiveRecord::Migration
  def change
    add_column :cornellsubjects, :name, :string
  end
end
