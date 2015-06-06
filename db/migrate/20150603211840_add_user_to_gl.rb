class AddUserToGl < ActiveRecord::Migration
  def change
	add_column :grocery_lists, :user_id, :int
  end
end
