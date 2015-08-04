class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def new 
		@project = Project.new
	end

	def create
		@project = Project.new
		@project = current_user.projects.new(project_params)

		respond_to do |format|
			if @project.save
				format.html  { redirect_to(@project,
            		:notice => 'Project was successfully created.') }
				format.json  { render :json => @project,
            		:status => :created, :location => @project }
			else
				format.html  { render :action => "new" }
				format.json  { render :json => @project.errors,
            		:status => :unprocessable_entity }
			end
		end
	end

	private

 	def project_params
 		params.require(:project).permit(:title, :image, :image1, :content, :notes)
 	end
end
