namespace :db do 
	task :generate_data =>  [:environment ] do 
		require 'faker'

		30.times do |x|
			User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
		end

		20.times do |x|
			food = Food.create(name: Faker::Lorem.word)
			recipe = Recipe.create(name: Faker::Lorem.sentence, description: Faker::Lorem.paragraph(2))
			Ingredient.create(food_id: food.id, recipe_id: recipe.id)
			Recipebook.create(recipe_id: recipe.id, user_id: User.find(rand(1..29)).id)
		end

		30.times do |x|
			Cupboard.create(user_id: User.find(rand(1..29)).id, food_id: Food.find(rand(1..19)).id)
		end
	end
end

