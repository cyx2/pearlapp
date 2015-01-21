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

require 'test_helper'

class TeammemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
