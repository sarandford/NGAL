class CupboardsController < ApplicationController
	respond_to :json, :html, :js
	def index 
		puts current_user.id
		# puts "*" * 80
		@foods = Cupboard.where(user_id: current_user.id)
	end
end
