class CommentsController < ApplicationController
 
	before_action :find_post

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id 

		@comment.save

		if @comment.save
			redirect_to :back
		end
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		flash[:success] = "Comment deleted!"
		redirect_to :back
	end


	private
		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_post
			@post = Post.find(params[:post_id])
		end
end
