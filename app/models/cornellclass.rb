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

class Cornellclass < ActiveRecord::Base
	has_many :users, :through => :ratings

	def showratings
		Rating.where(courseid: self.courseid)
	end
	# Aggregate data calculation      
  # Context calculation
	# Note inefficiency, but this works when the rating starts from nil
	def countratings
		self.numratings=self.showratings.count.to_int
		self.save
	end

	# Quality avg calculation
	def calcavgrating
		self.avgrating=self.showratings.average(:rating).to_f.round(3)
		self.save
	end
	def calcprofqual
		self.profqual=self.showratings.average(:profqual).to_f.round(3)
		self.save
	end
	def calctaqual
		self.taqual=self.showratings.average(:taqual).to_f.round(3)
		self.save
	end
	def calclecturequal
		self.lecturequal=self.showratings.average(:lecturequal).to_f.round(3)
		self.save
	end
	def calcrecitationqual
		self.recitationqual=self.showratings.average(:recitationqual).to_f.round(3)
		self.save
	end

	# Difficulty avg calculation
	def calchwdiff
		self.hwdiff=self.showratings.average(:hwdiff).to_f.round(3)
		self.save
	end
	def calcexamdiff
		self.examdiff=self.showratings.average(:examdiff).to_f.round(3)
		self.save
	end
	def calcmaterialdiff
		self.materialdiff=self.showratings.average(:materialdiff).to_f.round(3)
		self.save
	end
	def calcprojdiff
		self.projdiff=self.showratings.average(:projdiff).to_f.round(3)
		self.save
	end
	def calcprelimdiff
		self.prelimdiff=self.showratings.average(:prelimdiff).to_f.round(3)
		self.save
	end
	def calcpaperdiff
		self.paperdiff=self.showratings.average(:paperdiff).to_f.round(3)
		self.save
	end
	
  # Boolean avg calculation
	def calchwyesno
		@t=self.showratings.where(hwyesno: true).count
		@f=self.showratings.where(hwyesno: false).count

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
		@t=self.showratings.where(recitationreqdyesno: true).count
		@f=self.showratings.where(recitationreqdyesno: false).count

		if @t > @f
			self.recitationreqdyesno=true
		elsif @t < @f
			self.recitationreqdyesno=false
		else
			self.recitationreqdyesno=nil
		end
		self.save
	end
	def calcexamyesno
		@t=self.showratings.where(examyesno: true).count
		@f=self.showratings.where(examyesno: false).count

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
		@t=self.showratings.where(lecturereqdyesno: true).count
		@f=self.showratings.where(lecturereqdyesno: false).count

		if @t > @f
			self.lecturereqdyesno=true
		elsif @t < @f
			self.lecturereqdyesno=false
		else
			self.lecturereqdyesno=nil
		end
		self.save
	end
	def calcprojyesno
		@t=self.showratings.where(projyesno: true).count
		@f=self.showratings.where(projyesno: false).count

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
		@t=self.showratings.where(prelimyesno: true).count
		@f=self.showratings.where(prelimyesno: false).count

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
		@t=self.showratings.where(paperyesno: true).count
		@f=self.showratings.where(paperyesno: false).count

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
