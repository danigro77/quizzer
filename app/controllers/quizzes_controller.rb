class QuizzesController < ApplicationController
  # before_filter :authenticate
  
  def index
    p "DEBUG: #{current_user}"
    if is_student?(current_user)
      @quizzes = current_user.teacher.quizzes
    elsif is_teacher?(current_user)
      @quizzes = current_user.quizzes
    else
      redirect_to new_user_path
    end
  end
  
  def new
    @quiz = current_user.quizzes.build
  end

  def create
    @quiz = current_user.quizzes.build(params[:quiz])
    if @quiz.save
      redirect_to user_quizzes_path(current_user)
    else
      flash[:notice] = "Unable to create a new quiz."
      render :new
    end
  end
  
  def edit
    @quiz = Quiz.find(params[:id])
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(params[:quiz])
        redirect_to user_quizzes_path(current_user)
     else
        render :edit
     end
  end
  
  def delete
     Quiz.find(params[:id]).destroy
     redirect_to user_quizzes_path(current_user)
  end
  
end
