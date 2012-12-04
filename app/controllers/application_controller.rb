class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticated?
  
  def authenticated?
    redirect_to new_session_path unless current_user.present?  
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]       # TODO: does not work everywhere
    end
    
    def is_teacher?(user)
      user.role == "teacher"
    end

    def is_student?(user)
      user.role == "student"
    end

    helper_method :current_user, :is_teacher?, :is_student?
end
