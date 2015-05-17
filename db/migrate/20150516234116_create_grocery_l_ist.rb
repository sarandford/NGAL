class CreateGroceryLIst < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
    	t.integer :user_id
    	t.integer :food_id
    end
  end
end
