class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def new 
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project
		else
			redirect_to "projects#new"
		end
	end

	private

 	def project_params
 		params.require(:project).permit(:title, :image, :image1, :content, :notes)
 	end
end
