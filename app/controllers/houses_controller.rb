class HousesController < ApplicationController

	def index
		@user_houses = current_user.houses
	end

	def new 
		@house = House.new
		@project = Project.new
	end

	def show 
		# @project = Project.all
		# @project = Project.find(params[:id])
  		
  		# @project.house_id = params[:house_id]
      	# @project = Project.new
		
		@house = House.find(params[:id])
		@project = @house.projects
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @house }
      	end

	end

	def create
		@house = House.new(house_params)
		@house.user_id = current_user.id
		@house.save
		redirect_to house_projects_path(@house)
	end

	private

	def house_params
 		params.require(:house).permit(:title, :image, :content)
 	end
end
