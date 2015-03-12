class AdminpanelController < ApplicationController

	before_action :verify_user

	def mainview
	end



	private
		def verify_user
      redirect_to root_path, notice: "You shouldn't try to access this page! Stop!" unless (user_signed_in? && current_user.id == 1)
    end

end
