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

class Rating < ActiveRecord::Base	
	belongs_to :user
	# belongs_to :cornellclass

	#validates :rating, numericality: { :greater_than_or_equal_to => 0 }
	#validates :rating, :profqual, :taqual, :lecturequal, :recitationqual, :hwdiff, :examdiff, :materialdiff, :projdiff, :prelimdiff, numericality: { :less_than_or_equal_to => 5 }
	
	validates :rating, :prefix, :course_number, :semester, presence: true		

	validate :verify_user_has_not_already_rated_class

	def showclass
		Cornellclass.where(coursenumber: self.course_number, prefix: self.prefix)		
	end

	def format
    self.prefix=self.prefix.upcase
    self.save
  end

  def verify_user_has_not_already_rated_class
    if Rating.where("prefix = ? AND course_number = ? AND user_id = ?", :prefix, :course_number, :user_id).present?
    	errors.add("You've rated this class before!")
    end
  end

end
