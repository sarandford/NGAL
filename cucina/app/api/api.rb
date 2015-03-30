require 'food/data'

module API
	class Base < Grape::API
		mount Food::Data
	end
end

