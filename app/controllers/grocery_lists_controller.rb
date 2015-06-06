class GroceryListsController < ApplicationController

	def create
		@grocery_list_items = []
		params[:items_to_add].each do |id|
			@grocery_list_items << GroceryList.create(user: current_user, food_id: id)
		end
	end
end
