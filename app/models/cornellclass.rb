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

	def self.calcall
		Cornellclass.find_each do |c|
			c.calchwyesno
      c.calcrecitationreqdyesno
      c.calcexamyesno
      c.calclecturereqdyesno
      c.calcprojyesno      
      c.calcprelimyesno
      c.calcpaperyesno 
      c.calclabyesno
			c.calculate
		end
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
	
  def calclabyesno
  	if (self.labqual = 0 && self.labreqdyesno = nil)
  		self.labreqdyesno = nil
  	elsif (self.labreqdyesno = nil && self.labqual != 0)
  		self.labreqdyesno = true
  		self.labqual=self.showratings.average(:labqual).to_f.round(1)
  	elsif (self.labreqdyesno != nil && self.labqual = 0)
  		@f=self.showratings.where(labreqdyesno: false).count
			@t=self.showratings.where(labreqdyesno: true).count
			if @t > @f
				self.labreqdyesno=true
			elsif @t < @f
				self.labreqdyesno=false
			else
				self.labreqdyesno=nil
			end
		else
			self.labreqdyesno = true
		end
		self.save
	end
	def calchwyesno
		if (self.hwdiff = 0 && self.hwyesno = nil)
			self.hwyesno = nil
		elsif (self.hwyesno = nil && self.hwdiff != 0)
			self.hwyesno = true
			self.hwdiff=self.showratings.average(:hwdiff).to_f.round(1)
		elsif (self.hwyesno != nil && self.hwdiff = 0)
			@f=self.showratings.where(hwyesno: false).count
			@t=self.showratings.where(hwyesno: true).count
			if @t > @f
				self.hwyesno=true
			elsif @t < @f
				self.hwyesno=false
			else
				self.hwyesno=nil
			end
		else
			self.hwyesno = true
		end
		self.save
	end
	def calcrecitationreqdyesno
		if (self.recitationqual = 0 && self.recitationreqdyesno = nil)
  		self.recitationreqdyesno = nil
  	elsif (self.recitationreqdyesno = nil && self.recitationqual != 0)
  		self.recitationreqdyesno = true
  		self.recitationqual=self.showratings.average(:recitationqual).to_f.round(1)
  	elsif (self.recitationreqdyesno != nil && self.recitationqual = 0)
  		@f=self.showratings.where(recitationreqdyesno: false).count
			@t=self.showratings.where(recitationreqdyesno: true).count
			if @t > @f
				self.recitationreqdyesno=true
			elsif @t < @f
				self.recitationreqdyesno=false
			else
				self.recitationreqdyesno=nil
			end
		else
			self.recitationreqdyesno = true
		end
		self.save
	end
	def calcexamyesno
		if (self.examdiff = 0 && self.examyesno = nil)
  		self.examyesno = nil
  	elsif (self.examyesno = nil && self.examdiff != 0)
  		self.examyesno = true
  		self.examdiff=self.showratings.average(:examdiff).to_f.round(1)
  	elsif (self.examyesno != nil && self.examdiff = 0)
  		@f=self.showratings.where(examyesno: false).count
			@t=self.showratings.where(examyesno: true).count
			if @t > @f
				self.examyesno=true
			elsif @t < @f
				self.examyesno=false
			else
				self.examyesno=nil
			end
		else
			self.examyesno = true
		end
		self.save
	end
	def calclecturereqdyesno
		if (self.lecturequal = 0 && self.lecturereqdyesno = nil)
  		self.lecturereqdyesno = nil
  	elsif (self.lecturereqdyesno = nil && self.lecturequal != 0)
  		self.lecturereqdyesno = true
  		self.lecturequal=self.showratings.average(:lecturequal).to_f.round(1)
  	elsif (self.lecturereqdyesno != nil && self.lecturequal = 0)
  		@f=self.showratings.where(lecturereqdyesno: false).count
			@t=self.showratings.where(lecturereqdyesno: true).count
			if @t > @f
				self.lecturereqdyesno=true
			elsif @t < @f
				self.lecturereqdyesno=false
			else
				self.lecturereqdyesno=nil
			end
		else
			self.lecturereqdyesno = true
		end
		self.save
	end
	def calcprojyesno
		if (self.projdiff = 0 && self.projyesno = nil)
  		self.projyesno = nil
  	elsif (self.projyesno = nil && self.projdiff != 0)
  		self.projyesno = true
  		self.projdiff=self.showratings.average(:projdiff).to_f.round(1)
  	elsif (self.projyesno != nil && self.projdiff = 0)
  		@f=self.showratings.where(projyesno: false).count
			@t=self.showratings.where(projyesno: true).count
			if @t > @f
				self.projyesno=true
			elsif @t < @f
				self.projyesno=false
			else
				self.projyesno=nil
			end
		else
			self.projyesno = true
		end
		self.save
	end
	def calcprelimyesno
		if (self.prelimdiff = 0 && self.prelimyesno = nil)
  		self.prelimyesno = nil
  	elsif (self.prelimyesno = nil && self.prelimdiff != 0)
  		self.prelimyesno = true
  		self.prelimdiff=self.showratings.average(:prelimdiff).to_f.round(1)
  	elsif (self.prelimyesno != nil && self.prelimdiff = 0)
  		@f=self.showratings.where(prelimyesno: false).count
			@t=self.showratings.where(prelimyesno: true).count
			if @t > @f
				self.prelimyesno=true
			elsif @t < @f
				self.prelimyesno=false
			else
				self.prelimyesno=nil
			end
		else
			self.prelimyesno = true
		end
		self.save
	end
	def calcpaperyesno
		if (self.paperdiff = 0 && self.paperyesno = nil)
  		self.paperyesno = nil
  	elsif (self.paperyesno = nil && self.paperdiff != 0)
  		self.paperyesno = true
  		self.paperdiff=self.showratings.average(:paperdiff).to_f.round(1)
  	elsif (self.paperyesno != nil && self.paperdiff = 0)
  		@f=self.showratings.where(paperyesno: false).count
			@t=self.showratings.where(paperyesno: true).count
			if @t > @f
				self.paperyesno=true
			elsif @t < @f
				self.paperyesno=false
			else
				self.paperyesno=nil
			end
		else
			self.paperyesno = true
		end
		self.save
	end

end
