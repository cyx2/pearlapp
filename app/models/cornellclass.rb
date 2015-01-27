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

	# Note inefficiency, but this works when the rating starts from nil
	def calcavgrating
		self.avgrating=self.showratings.average(:rating).to_f.round(3)
		self.save
	end

	# Note inefficiency, but this works when the rating starts from nil
	def countratings
		self.numratings=self.showratings.count.to_int
		self.save
	end

	def calchwyesno
		@t=self.showratings.where(hwyesno: true).count
		@f=self.showratings.where(hwyesno: false).count

		if @t > @f
			self.hwyesno=true
		elsif @t < @f
			self.hwyesno=false
		else
			self.hwyesno=nil
		end
		self.save
	end

end
