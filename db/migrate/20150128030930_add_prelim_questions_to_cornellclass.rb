class AddPrelimQuestionsToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :prelimyesno, :boolean
    add_column :cornellclasses, :prelimdiff, :float
  end
end
