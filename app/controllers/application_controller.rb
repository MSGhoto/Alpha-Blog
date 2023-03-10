class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    def logged_in?
        # To bool check if user is persent
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You need to login to perfom this action"
            redirect_to login_path
        end
    end
end
