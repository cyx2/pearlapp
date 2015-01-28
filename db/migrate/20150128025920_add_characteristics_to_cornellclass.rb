class AddCharacteristicsToCornellclass < ActiveRecord::Migration
  def change
    add_column :cornellclasses, :profqual, :float
    add_column :cornellclasses, :taqual, :float
    add_column :cornellclasses, :lecturequal, :float
    add_column :cornellclasses, :recitationqual, :float
    add_column :cornellclasses, :recitationreqdyesno, :boolean
    add_column :cornellclasses, :hwdiff, :float
    add_column :cornellclasses, :examdiff, :float
    add_column :cornellclasses, :examyesno, :boolean
    add_column :cornellclasses, :lecturereqdyesno, :boolean
    add_column :cornellclasses, :materialdiff, :float
    add_column :cornellclasses, :projyesno, :boolean
    add_column :cornellclasses, :projdiff, :float
  end
end
