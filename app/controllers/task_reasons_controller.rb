class TaskReasonsController < ApplicationController
	before_action :authenticate_user!
	def index
		@task_reasons = TaskReason.all
	end
	def new
		@task_reason= TaskReason.new
	end
	def create
		@task_reason= TaskReason.new(task_reason_params)
		@task_reason.user_id = current_user.id

		if @task_reason.save!
			redirect_to tasks_path
		end
	end

	private
	def task_reason_params
	params.require(:task_reason).permit(:user_id,:task_id,:reasons)
	end
end
