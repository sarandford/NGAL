class CreateCupboards < ActiveRecord::Migration
  def change
    create_table :cupboards do |t|
      t.integer :user_id
      t.integer :food_id
      t.datetime :expiration_date

      t.timestamps null: false
    end
  end
end
