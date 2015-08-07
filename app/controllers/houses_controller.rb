class HousesController < ApplicationController
	def index
		@house = House.all
	end

	def new 
		@house = House.new
	end

	def create
		@house = House.new(house_params)
		@house.save
		redirect_to house_path(@house)
	end

	def show 

      	@project = Project.new
		

		@house = House.find(params[:id])
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @house }
      	end

	end
	

	private

	def house_params
 		params.require(:house).permit(:title, :image, :image_file_name, :content)
 	end
end
