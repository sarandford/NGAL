class CupboardsController < ApplicationController
	respond_to :json, :html, :js
	def index 
		@foods = Cupboard.where(user_id: current_user.id)
	end

	def create
		@food = ((Food.where(name: params[:name]).empty?) ? Food.create(name: params[:name]) : Food.where(name: params[:name]).first)
		Cupboard.create(user_id: current_user.id, food_id: @food.id )
	end

	def destroy
		puts "*" * 80
		Cupboard.delete(params[:items_to_delete])
	end
end
