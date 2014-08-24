module ApplicationHelper

	def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def admin_user
      @admin_user ||= User.find(session[:user_id]) if (session[:user_id].to_i == 22)
    end
end
