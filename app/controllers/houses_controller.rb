class HousesController < ApplicationController
	def index
		@house = House.all
	end

	def new 
		@house = House.new
	end
end
