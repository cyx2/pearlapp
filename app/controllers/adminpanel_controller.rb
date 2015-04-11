class AdminpanelController < ApplicationController

	before_action :verify_user

	def stats
		@numRatings = Rating.count
		@numUsers = User.count

		@avgnumRatings = 0;
		@numSignins = 0;
		User.all.each do |user|
			@avgnumRatings += user.ratings.count
			@numSignins += user.sign_in_count
		end
		@avgnumRatings = (@avgnumRatings.to_f/@numUsers.to_f).round(3)
		@numSignins = (@numSignins.to_f / @numUsers.to_f).round(3)

		@avgRating = Rating.average(:rating).round(3)

		@recentUsers = User.order("created_at DESC").first(5)

		@recentRatings = Rating.order("created_at DESC").first(5)

		@moreThanOneRating = Cornellclass.where("numratings > ?", 1).count

		@percentageRated = ((@moreThanOneRating.to_f/Cornellclass.all.count.to_f)*100).to_f.round(3)

	end

	def usersbycreated
		@recentUsers = User.order("created_at DESC")
	end

	def allusers
		@allUsers = User.all
	end



	private
		def verify_user
      redirect_to root_path, notice: "You shouldn't try to access this page! Stop!" unless ((user_signed_in? && current_user.id == 1) || (user_signed_in? && current_user.id == 6) || (user_signed_in? && current_user.id == 9))
    end

end
