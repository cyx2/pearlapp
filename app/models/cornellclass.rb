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

class Cornellclass < ActiveRecord::Base
	has_many :users, :through => :ratings

	def showratings
		Rating.where(courseid: self.courseid)
	end

	def calcavgrating
		self.avgrating=self.showratings.average(:rating).to_f
	end

end
