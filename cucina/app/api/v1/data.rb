module V1
  class Data < Grape::API
 		
 		version 'v1', using: :path
 		format :json

 		resource :users do 
 			
 		end

   	resource :foods do
     	
     desc "List all food items"
      get :food_items do
        Food.all
      end

     desc "Create a new food"
    	params do 
    		requires :name, type: String
    	end

    	post :new_food do
    		Food.create!({name: params[:name]})
    	end 
    end

    resource :ingredients do 
    end

    resource :users do 
    end

    resource :cupboards do
    end

    resource :recipes do
    end

    resource :recipebooks do
    end
  end
end
