class CommentsController < ApplicationController
  
  
	def new
		@comment = Comment.new
	end

	def create
		@task = Task.find(params[:comment][:task_id])
		@comment = @task.comments.new(comment_params)
		@comment.user_id = current_user.id
    	if @comment.save
    	redirect_to task_path(@task)
    	end    
  	end 
  	private
  	def comment_params
    params.require(:comment).permit(:comment,:user_id,:commentable_id, :commentable_type)
	end
  
end
