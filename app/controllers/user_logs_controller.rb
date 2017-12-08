class UserLogsController < ApplicationController
	before_action :authenticate_user!
	def index
		@user_logs =UserLog.all
	end 
	def new 
		@user_log =UserLog.new
	end
	def create
		@user_log = UserLog.new(user_log_params)
		@user_log.user_status = "work from home"
		@user_log.save!
	end

end
private
def user_log_params
	params.require(:user_log).permit(:user_id,:log_in_time,:sign_out_time)
end
