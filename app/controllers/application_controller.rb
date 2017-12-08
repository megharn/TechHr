class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
 
  #before_action :authenticate_user!
  def authenticate_admin!
 	
 	if !current_user
 		flash[:notice] = "sign_in first"
 		redirect_to new_user_session_path 
 		return false
 	end

 	if current_user.is_admin?
 		true
 	else
 		redirect_to "/"
 		flash[:notice]  = "you are not admin"
 	end

  end

  protected  
    def after_sign_in_path_for(resource)      
      sign_in_url = new_user_session_url    
      log = UserLog.where(user_id: current_user.id).where("created_at >= ?", DateTime.now.beginning_of_day)
      unless log.present?
        UserLog.create(log_in_time:DateTime.now, user_id: current_user.id)
      end    
        if request.referer == sign_in_url 
        super
        else
          stored_location_for(resource) || request.referer || root_path
        end
    end
end


