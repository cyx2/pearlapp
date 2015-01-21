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

class Rating < ActiveRecord::Base	
	belongs_to :user
	# belongs_to :cornellclass

	validates :rating, numericality: { :greater_than_or_equal_to => 0 }
	validates :rating, numericality: { :less_than_or_equal_to => 5 }
	validates :rating, :prefix, :course_number, presence: true	

	def listclass
		Cornellclass.where(courseid: self.courseid)		
	end
end
