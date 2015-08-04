class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def new 
		@project = Project.new
	end

	def show 
		@project = Project.find(params[:id])
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @project }
      	end
	end


	def create
		@project = Project.new(project_params)
		@project.user = current_user

	  	respond_to do |format|
	    	if @project.save
	      		format.html  { redirect_to(@project,
	                    :notice => 'Project was successfully created.') }
	      		format.json  { render :json => @project,
	                    :status => :created, :location => @project }
	    	else
	      		format.html  { render :action => "projects" }
	      		format.json  { render :json => @project.errors,
	                    :status => :unprocessable_entity }
	    	end
	  	end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		respond_to do |format|
			if @project.update_attributes(project_params)
				format.html {redirect_to(@project,
					:notice => 'Project was successfully updated')}
				format.json {head :no_content}
			else
				format.html {render :action => "edit"}
				format.json {render :json => @project.errors,
					:status => :unprocessable_entity}
			end
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
