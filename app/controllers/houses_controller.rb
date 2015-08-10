class HousesController < ApplicationController

	def index
		@user_houses = current_user.houses
	end

	def new 
		@house = House.new
		@project = Project.new
	end

	def show 
      	@project = Project.new
		
		@house = House.find(params[:id])
		@project = @house.projects
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @house }
      	end

		

	end

	def create
		@project = Project.new
		@house = House.new(house_params)
		@house.user_id = current_user.id
		@house.save
		redirect_to house_path(@house)
	end

	def destroy
		@house = House.find(params[:id])
		@house.destroy

		respond_to do |format|
			format.html {redirect_to houses_url}
		end
	end

	def edit
		@house = House.find(params[:id])
	end
		def update		
		@house = House.find(params[:id])
		@house.update(house_params)
		redirect_to house_path(@house)
	end


	private

	def house_params
 		params.require(:house).permit(:title, :image, :content)
 	end
end
