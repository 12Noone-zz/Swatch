class ProjectsController < ApplicationController
	before_action :require_current_user, :except => :index

	def index
		@project = Project.all
	end

	def new 
		@project = Project.new
	end

	def show 
      	@comment = Comment.new
		

		@project = Project.find(params[:id])
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @project }
      	end

	end


	def create
		@project = Project.new(project_params)
		redirect_to root_path
		
		# @project.house_id = current_user.id
		
		@project.save
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		
		@project = Project.find(params[:id])
		@project.update(project_params)
		redirect_to project_path(@project)

	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		respond_to do |format|
			format.html {redirect_to projects_url}
		end
	end

	private

 	def project_params
 		params.require(:project).permit(:title, :image1, :image2, :image3, :image4, :image5, :content, :notes, :tag_list)
 	end
end
