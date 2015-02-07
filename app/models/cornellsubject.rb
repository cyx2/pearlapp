# == Schema Information
#
# Table name: cornellsubjects
#
#  id         :integer          not null, primary key
#  prefix     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Cornellsubject < ActiveRecord::Base
end
