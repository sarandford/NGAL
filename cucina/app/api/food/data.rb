module Food
  class Data < Grape::API
 		
 		version 'v1', using: :path
 		format :json

   	resource :food do
     	desc "List all food items"
 
      get :food_items do
        Food.all
      end
 
    end
 
  end
end
