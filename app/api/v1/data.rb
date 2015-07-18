module V1
  class Data < Grape::API
 		
 		version 'v1', using: :path
 		format :json

    resource :recipes do 

      desc "get ingredients to search for recipes" 

        params do 
          requires :ingredients, type: String
        end

        get :search do
          RestClient.get "http://food2fork.com/api/search?key=c3c2406305ef3e33c68210f57d5f0719&q=#{params[:ingredients]}"
        end

     
    end

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
      get :ingredients do 
        Ingredient.all
      end
    end

    resource :cupboards do
    end

    resource :recipes do
    end

    resource :recipebooks do
    end

    resource :sessions do

     desc "Authenticate user and return user object / access token"

     params do
       requires :email, type: String, desc: "User email"
       requires :password, type: String, desc: "User Password"
     end

     post do
       email = params[:email]
       password = params[:password]

       if email.nil? or password.nil?
         error!({error_code: 404, error_message: "Invalid Email or Password."},401)
         return
       end

       user = User.where(email: email.downcase).first
       if user.nil?
         error!({error_code: 404, error_message: "Invalid Email or Password."},401)
         return
       end

       if !user.valid_password?(password)
         error!({error_code: 404, error_message: "Invalid Email or Password."},401)
         return
       else
         user.ensure_authentication_token!
         user.save
         {status: 'ok', token: user.authentication_token}.to_json
       end
     end

     desc "Destroy the access token"
     params do
       requires :access_token, type: String, desc: "User Access Token"
     end
     delete ':access_token' do
       access_token = params[:access_token]
       user = User.where(authentication_token: access_token).first
       if user.nil?
         error!({error_code: 404, error_message: "Invalid access token."},401)
         return
       else
         user.reset_authentication_token
         #{status: 'ok'}
       end
     end
    end
  end
end
