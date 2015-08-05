class ProjectsController < ApplicationController
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
		@project.save
		redirect_to project_path(@project)
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		
		@project = Project.find(params[:id])

		@project.update(project_params)

		if @project.errors
			render :edit
		else
			redirect_to @project
		end
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
 		params.require(:project).permit(:title, :image, :image_file_name, :content, :notes)
 	end
end
