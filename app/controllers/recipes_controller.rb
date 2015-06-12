class RecipesController < ApplicationController
	after_filter :allow_iframe_requests

	def index 
		@ingredients = Cupboard.where(user_id: current_user.id)
		render
	end

	def search
		@ingredients = params[:items_to_search]
		@ingredients = Cupboard.find(@ingredients)
		@ingredients = to_comma_seperated_string(@ingredients)
		puts @ingredients.inspect
		@urls = []
		response = RestClient.get "http://food2fork.com/api/search?key=c3c2406305ef3e33c68210f57d5f0719&q=#{@ingredients}"
		response = eval(response)
		for item in response[:recipes] do
			@urls << item[:source_url]
		end
	end

	private 
	def to_comma_seperated_string(words)
		container = ""
		for word in words do 
			container += "#{word.food.name},"
		end
		return container
	end
	def allow_iframe_requests
  		response.headers.delete('X-Frame-Options')
	end
end
