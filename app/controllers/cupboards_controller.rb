class CupboardsController < ApplicationController
	respond_to :json, :html, :js
	def index 
		@foods = Cupboard.where(user_id: current_user.id)
	end
end
