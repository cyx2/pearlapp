# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  rater         :string
#  rating        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  prefix        :string
#  course_number :integer
#  courseid      :integer
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
