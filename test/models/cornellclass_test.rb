# == Schema Information
#
# Table name: cornellclasses
#
#  id           :integer          not null, primary key
#  title        :string
#  prefix       :string
#  coursenumber :integer
#  avgrating    :float
#  numratings   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  courseid     :integer
#

require 'test_helper'

class CornellclassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
