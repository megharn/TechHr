class UsersController < ApplicationController

	def edit
		@user= User.find(current_user.id)
		
	end
	def update
		@user= User.find(params[:id])
		if @user.update(user_params)
      		redirect_to root_path
    	else
      		render :edit
    	end
  	end
  	def before_log_out
  	  @user_log= UserLog.where(user_id: current_user.id).where("created_at >= ?", DateTime.now.beginning_of_day).first
     	@user_log.update(sign_out_time: DateTime.now)
    	sign_out(current_user) 
    	redirect_to new_user_session_path  
  	end

private
  	def user_params
    	params.require(:user).permit(:communication_address,:permanent_address,:blood_group,:password,:password_confirmation)
  	end			

end
