class AddAttachmentImageToTeammembers < ActiveRecord::Migration
  def self.up
    change_table :teammembers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teammembers, :image
  end
end
