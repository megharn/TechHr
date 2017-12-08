namespace :update_leave_users do
  desc "update leave user"
  task :update_leave => :environment  do
    date = Date.today
		log_user = UserLog.where(log_in_time: date.midnight..date.end_of_day).pluck(:user_id)
		users= User.pluck(:id)
		leaves_user = users - log_user
		leaves_user.each do |l_u|
			UserLog.create(user_status: "leave" ,user_id: l_u)
		end
  end
end
