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
		self.avgrating=self.showratings.average(:rating).to_f.round(1)
		self.profqual=self.showratings.average(:profqual).to_f.round(1)
		self.taqual=self.showratings.average(:taqual).to_f.round(1)
		self.lecturequal=self.showratings.average(:lecturequal).to_f.round(1)
		self.recitationqual=self.showratings.average(:recitationqual).to_f.round(1)
		self.labqual=self.showratings.average(:labqual).to_f.round(1)
		# Difficulty avg calculation
		self.hwdiff=self.showratings.average(:hwdiff).to_f.round(1)
		self.examdiff=self.showratings.average(:examdiff).to_f.round(1)
		self.materialdiff=self.showratings.average(:materialdiff).to_f.round(1)
		self.projdiff=self.showratings.average(:projdiff).to_f.round(1)
		self.prelimdiff=self.showratings.average(:prelimdiff).to_f.round(1)
		self.paperdiff=self.showratings.average(:paperdiff).to_f.round(1)
		# Calculate avg grade
		self.avggrade=self.showratings.average(:grade).to_f.round(1)
		self.save
	end
	
  # Boolean avg calculation
  def calclabyesno

  	# If no quality, then look at T/F statements
  	if self.labqual = nil
  		@f=self.showratings.where(labreqdyesno: false).count
			@t=self.showratings.where(labreqdyesno: true).count
			if @t > @f
				self.labreqdyesno=true
			elsif @t < @f
				self.labreqdyesno=false
				self.labqual=0
			else
				self.labreqdyesno=nil
			end
		# If there is lab quality, then there is lab
  	else
  		@f=self.showratings.where(labqual: nil).count
			@t=self.showratings.where.not(labqual: nil).count	
		end

		self.save
	end
	def calchwyesno
		
		if self.hwdiff = nil
  		@f=self.showratings.where(hwyesno: false).count
			@t=self.showratings.where(hwyesno: true).count
			if @t > @f
				self.hwyesno=true
			elsif @t < @f
				self.hwyesno=false
				self.hwdiff=0
			else
				self.hwyesno=nil
			end
  	else
  		@f=self.showratings.where(hwdiff: nil).count
			@t=self.showratings.where.not(hwdiff: nil).count	
		end

		self.save
	end
	def calcrecitationreqdyesno

		if self.recitationqual = nil
  		@f=self.showratings.where(recitationreqdyesno: false).count
			@t=self.showratings.where(recitationreqdyesno: true).count
			if @t > @f
				self.recitationreqdyesno=true
			elsif @t < @f
				self.recitationreqdyesno=false
				self.recitationqual=0
			else
				self.recitationreqdyesno=nil
			end
  	else
  		@f=self.showratings.where(recitationqual: nil).count
			@t=self.showratings.where.not(recitationqual: nil).count	
		end
		self.save
	end
	def calcexamyesno
		
		if self.examdiff = nil
  		@f=self.showratings.where(examyesno: false).count
			@t=self.showratings.where(examyesno: true).count
			if @t > @f
				self.examyesno=true
			elsif @t < @f
				self.examyesno=false
				self.examdiff=0
			else
				self.examyesno=nil
			end
  	else
  		@f=self.showratings.where(examdiff: nil).count
			@t=self.showratings.where.not(examdiff: nil).count	
		end

		self.save
	end
	def calclecturereqdyesno
		
		if self.lecturequal = nil
  		@f=self.showratings.where(lecturereqdyesno: false).count
			@t=self.showratings.where(lecturereqdyesno: true).count
			if @t > @f
				self.lecturereqdyesno=true
			elsif @t < @f
				self.lecturereqdyesno=false
				self.lecturequal=0
			else
				self.lecturereqdyesno=nil
			end
  	else
  		@f=self.showratings.where(lecturequal: nil).count
			@t=self.showratings.where.not(lecturequal: nil).count	
		end

		self.save
	end
	def calcprojyesno
		
		if self.projdiff = nil
  		@f=self.showratings.where(projyesno: false).count
			@t=self.showratings.where(projyesno: true).count
			if @t > @f
				self.projyesno=true
			elsif @t < @f
				self.projyesno=false
				self.projdiff=0
			else
				self.projyesno=nil
			end
  	else
  		@f=self.showratings.where(projdiff: nil).count
			@t=self.showratings.where.not(projdiff: nil).count	
		end

		self.save
	end
	def calcprelimyesno
		
		if self.prelimdiff = nil
  		@f=self.showratings.where(prelimyesno: false).count
			@t=self.showratings.where(prelimyesno: true).count
			if @t > @f
				self.prelimyesno=true
			elsif @t < @f
				self.prelimyesno=false
				self.prelimdiff=0
			else
				self.prelimyesno=nil
			end
  	else
  		@f=self.showratings.where(prelimdiff: nil).count
			@t=self.showratings.where.not(prelimdiff: nil).count	
		end

		self.save
	end
	def calcpaperyesno
		
		if self.paperdiff = nil
  		@f=self.showratings.where(paperyesno: false).count
			@t=self.showratings.where(paperyesno: true).count
			if @t > @f
				self.paperyesno=true
			elsif @t < @f
				self.paperyesno=false
				self.paperdiff=0
			else
				self.paperyesno=nil
			end
  	else
  		@f=self.showratings.where(paperdiff: nil).count
			@t=self.showratings.where.not(paperdiff: nil).count	
		end

		self.save
	end

end
