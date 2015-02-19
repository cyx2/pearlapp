# == Schema Information
#
# Table name: cornellclasses
#
#  id                  :integer          not null, primary key
#  title               :string
#  prefix              :string
#  coursenumber        :integer
#  avgrating           :float
#  numratings          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  courseid            :integer
#  instructor          :string
#  hwyesno             :boolean
#  profqual            :float
#  taqual              :float
#  lecturequal         :float
#  recitationqual      :float
#  recitationreqdyesno :boolean
#  hwdiff              :float
#  examdiff            :float
#  examyesno           :boolean
#  lecturereqdyesno    :boolean
#  materialdiff        :float
#  projyesno           :boolean
#  projdiff            :float
#  prelimyesno         :boolean
#  prelimdiff          :float
#  semester            :string
#  paperyesno          :boolean
#  paperdiff           :float
#  name                :string
#

require 'test_helper'

class CornellclassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
