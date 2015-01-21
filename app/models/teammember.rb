# == Schema Information
#
# Table name: teammembers
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  website            :string
#  quote              :string
#  quoted_person      :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  position           :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Teammember < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :name, presence: true
	validates :position, presence: true
end
