require 'v1/data'

module API
	class Base < Grape::API
		mount V1::Data
	end
end

