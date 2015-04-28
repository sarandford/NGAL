class UserController < ApplicationController
	def show
		@cupboard = Cupboard.where(user: current_user)
		@recipes = Recipebook.where(user: current_user)
		@cupboard = @cupboard.map { |e| Food.find(e.food_id).name  }
		render
	end 
end
