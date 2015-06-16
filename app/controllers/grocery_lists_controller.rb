class GroceryListsController < ApplicationController

	def create
		if params.has_key?(:items_to_add)
			puts "in the if" * 80
			@grocery_list_items = []
			@add_from_cupboard = true
			params[:items_to_add].each do |id|
				@grocery_list_items << GroceryList.create(user_id: current_user.id, food_id: Cupboard.find(id).food.id)
				Cupboard.delete(id)
			end
			render "cupboards/destroy"
		else
			puts "in the else" * 80
			@add_from_cupboard = false
			@food = ((Food.where(name: params[:name]).empty?) ? Food.create(name: params[:name]) : Food.where(name: params[:name]).first)
			@grocery_list = GroceryList.create(user_id: current_user.id, food_id: @food.id)
			render "create.js.coffee"

		end
	end
	def index
		render "create"
	end

	def destroy
		GroceryList.delete(params[:items_to_delete])
	end

	def add_to_cupboard
		puts "*" * 80
		puts params[:items_to_add].inspect
		@cupboards = []
		params[:items_to_add].each do |id|
			@cupboards << Cupboard.create(user_id: current_user.id, food_id: GroceryList.find(id).food.id)
			GroceryList.delete(id)
		end
		puts @cupboard.inspect
	end
end
