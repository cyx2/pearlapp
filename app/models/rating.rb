class Rating < ActiveRecord::Base
	belongs_to :user

	validates :rating, numericality: { :greater_than_or_equal_to => 0 }
	validates :rating, numericality: { :less_than_or_equal_to => 5 }
	validates :rating, :prefix, :course_number, presence: true
end