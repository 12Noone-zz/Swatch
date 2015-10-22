class CommentsController < ApplicationController

 	def create
 		@house = House.find(params["house_id"])
		@project = Project.find(params[:project_id])
		@comment = @project.comments.create(comment_params)
    	@comment.author_name = current_user.name
    	@comment.save
		redirect_to project_path(@project)
	end

	def destroy
		@post = Project.find(params[:project_id])
		@comment = @project.comments.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html {redirect_to @project}
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:name, :content)
		end
end