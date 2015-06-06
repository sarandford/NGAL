class AddFoodToGl < ActiveRecord::Migration
  def change
  	add_column :grocery_lists, :food_id, :int
  end
end
