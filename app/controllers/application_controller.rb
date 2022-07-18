class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    helper_method :logged_in?    #add this line so as to be seen in views and app. instead of adding it in helper only will be seen in views only

    def logged_in?
        !!current_user  #this will return boolean true or false
    end

    def require_user 
        if !logged_in?
            flash[:alert] = "you must be logged in to perform that action"
            redirect_to user_session_path 
        end
    end
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :company, :position, :department, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :company, :position, :department, :email, :password, :current_password)}
    end

end

