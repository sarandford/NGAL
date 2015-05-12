class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :food_id
      t.integer :qty
      t.string :unit

      t.timestamps null: false
    end
  end
end
