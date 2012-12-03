class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
      # def authenticate
      #   authenticate_or_request_with_http_basic do |username, password|
      #      username == USER_ID && password == PASSWORD
      #    end
      # end
      
  private
    def current_user
      @current_user ||= User.find(params[:user_id]) if params[:user_id]       # TODO: does not work everywhere
    end
    
    def is_teacher?(user)
      user.role == "teacher"
    end

    def is_student?(user)
      user.role == "student"
    end

    helper_method :current_user, :is_teacher?, :is_student?
end
