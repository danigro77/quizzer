class QuizzesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    if @user.role == 'student'
      @quizzes = @user.teacher.quizzes
    elsif @user.role == 'teacher'
      @quizzes = @user.quizzes
    else
      redirect_to new_user_path
    end
  end
  
end