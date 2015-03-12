class AdminpanelController < ApplicationController

	before_action :verify_user

	def mainview
		@numRatings = Rating.count
		@numUsers = User.count

		@avgnumRatings = 0;
		@numSignins = 0;
		User.all.each do |user|
			@avgnumRatings += user.ratings.count
			@numSignins += user.sign_in_count
		end
		@avgnumRatings = @avgnumRatings.to_f/@numUsers.to_f
		@numSignins = @numSignins.to_f / @numUsers.to_f

		@avgRating = Rating.average(:rating)

	end



	private
		def verify_user
      redirect_to root_path, notice: "You shouldn't try to access this page! Stop!" unless (user_signed_in? && current_user.id == 1)
    end

end