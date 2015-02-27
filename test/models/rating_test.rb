# == Schema Information
#
# Table name: ratings
#
#  id                  :integer          not null, primary key
#  rating              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  prefix              :string
#  course_number       :integer
#  courseid            :integer
#  hwyesno             :boolean
#  profqual            :integer
#  taqual              :integer
#  lecturequal         :integer
#  recitationqual      :integer
#  recitationreqdyesno :boolean
#  hwdiff              :integer
#  examdiff            :integer
#  examyesno           :boolean
#  lecturereqdyesno    :boolean
#  materialdiff        :integer
#  projyesno           :boolean
#  projdiff            :integer
#  prelimyesno         :boolean
#  prelimdiff          :integer
#  semester            :string
#  paperyesno          :boolean
#  paperdiff           :integer
#  moretosay           :text
#  labreqdyesno        :boolean
#  labqual             :integer
#  grade               :integer
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
