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
#  credits             :string
#  labreqdyesno        :boolean
#  labqual             :float
#  avggrade            :float
#

class Cornellclass < ActiveRecord::Base
	has_many :users, :through => :ratings

	def showratings
		Rating.where(prefix: self.prefix, course_number: self.coursenumber)
	end
	# Aggregate data calculation      
  # Context calculation
	# Note inefficiency, but this works when the rating starts from nil
	def countratings
		self.numratings=self.showratings.count.to_int
		self.save
	end

	def calculate
		# Quality avg calculation
		self.avgrating=self.showratings.average(:rating).to_f.round(3)
		self.profqual=self.showratings.average(:profqual).to_f.round(3)
		self.taqual=self.showratings.average(:taqual).to_f.round(3)
		self.lecturequal=self.showratings.average(:lecturequal).to_f.round(3)
		self.recitationqual=self.showratings.average(:recitationqual).to_f.round(3)
		self.labqual=self.showratings.average(:labqual).to_f.round(3)
		# Difficulty avg calculation
		self.hwdiff=self.showratings.average(:hwdiff).to_f.round(3)
		self.examdiff=self.showratings.average(:examdiff).to_f.round(3)
		self.materialdiff=self.showratings.average(:materialdiff).to_f.round(3)
		self.projdiff=self.showratings.average(:projdiff).to_f.round(3)
		self.prelimdiff=self.showratings.average(:prelimdiff).to_f.round(3)
		self.paperdiff=self.showratings.average(:paperdiff).to_f.round(3)
		# Calculate avg grade
		self.avggrade=self.showratings.average(:grade).to_f.round(1)
		self.save
	end
	
  # Boolean avg calculation
  def calclabyesno		
		@f=self.showratings.where(labqual: nil).count
		@t=self.showratings.where.not(labqual: nil).count

		if @t > @f
			self.labreqdyesno=true
		elsif @t < @f
			self.labreqdyesno=false
			self.labqual=0
		else
			self.labreqdyesno=nil
		end
		self.save
	end
	def calchwyesno
		@t=self.showratings.where.not(hwdiff: nil).count
		@f=self.showratings.where(hwdiff: nil).count

		if @t > @f
			self.hwyesno=true
		elsif @t < @f
			self.hwyesno=false
			self.hwdiff=0
		else
			self.hwyesno=nil
		end
		self.save
	end
	def calcrecitationreqdyesno
		@t=self.showratings.where.not(recitationqual: nil).count
		@f=self.showratings.where(recitationqual: nil).count

		if @t > @f
			self.recitationreqdyesno=true
		elsif @t < @f
			self.recitationreqdyesno=false
			self.recitationqual=0
		else
			self.recitationreqdyesno=nil
		end
		self.save
	end
	def calcexamyesno
		@t=self.showratings.where.not(examdiff: nil).count
		@f=self.showratings.where(examdiff: nil).count

		if @t > @f
			self.examyesno=true
		elsif @t < @f
			self.examyesno=false
			self.examdiff=0
		else
			self.examyesno=nil
		end
		self.save
	end
	def calclecturereqdyesno
		@t=self.showratings.where.not(lecturequal: nil).count
		@f=self.showratings.where(lecturequal: nil).count

		if @t > @f
			self.lecturereqdyesno=true
		elsif @t < @f
			self.lecturereqdyesno=false
			self.lecturequal=0
		else
			self.lecturereqdyesno=nil
		end
		self.save
	end
	def calcprojyesno
		@t=self.showratings.where.not(projdiff: nil).count
		@f=self.showratings.where(projdiff: nil).count

		if @t > @f
			self.projyesno=true
		elsif @t < @f
			self.projyesno=false
			self.projdiff=0
		else
			self.projyesno=nil
		end
		self.save
	end
	def calcprelimyesno
		@t=self.showratings.where.not(prelimdiff: nil).count
		@f=self.showratings.where(prelimdiff: nil).count

		if @t > @f
			self.prelimyesno=true
		elsif @t < @f
			self.prelimyesno=false
			self.prelimdiff=0
		else
			self.prelimyesno=nil
		end
		self.save
	end
	def calcpaperyesno
		@t=self.showratings.where.not(paperdiff: nil).count
		@f=self.showratings.where(paperdiff: nil).count

		if @t > @f
			self.paperyesno=true
		elsif @t < @f
			self.paperyesno=false
			self.paperdiff=0
		else
			self.paperyesno=nil
		end
		self.save
	end

end
