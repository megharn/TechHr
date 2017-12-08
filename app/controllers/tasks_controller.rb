class TasksController < ApplicationController
before_action :authenticate_user!
	def index
		@tasks= current_user.tasks
	end

	def show
		@task = current_user.tasks.find_by(id: params[:id])
		if !@task
			redirect_to '/'
			flash[:notice]  = "access denied"
		end
	end

	def edit
		@task= Task.find(params[:id])
	end

	def update
		@task= Task.find(params[:id])		
	 	if task_params[:status] == "completed"
	 		@task.completed_date = Date.today
	 	end	 	
	 		if @task.update(task_params)
	 			redirect_to root_path
	 		else
	 			render :edit
	 		end   	     
  end
  def complete_task
  	 @task=Task.find(params[:task_id])
  	 @task.update_attributes(status: "completed", completed_date: Date.today)
	 	 redirect_to tasks_path
  end
	def hold_task
		@task=Task.find(params[:task_id])
		@task.update_attribute(:status,"hold")
		redirect_to new_task_reason_path(task_id: @task.id)
	end
	def open_task
		@task=Task.find(params[:task_id])
		@task.update_attribute(:status, "progress")
		redirect_to task_path(@task)
	end

  private

  	def task_params
  		params.require(:task).permit(:status,:completed_date)
		end

end
