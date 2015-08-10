class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.project_id = params[:project_id]
		@comment.project_id = params["project_id"]
		@comment.save

		redirect_to house_project_path(@comment.project)
	end

	def update		
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)
		redirect_to comment_path(@comment)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html {redirect_to comments_url}
		end
	end

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end
