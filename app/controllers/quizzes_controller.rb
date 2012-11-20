class QuizzesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @quizzes = @user.quizzes
  end
  
end