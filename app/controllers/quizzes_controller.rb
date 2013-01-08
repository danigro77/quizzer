class QuizzesController < ApplicationController
  
  def index
    @quizzes = current_user.contributable_quizzes
  end
  
  def show
    @quiz = Quiz.find(params[:id])
  end
  
  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new params[:quiz]
    if @quiz.save
      redirect_to user_courses_path(current_user)
    else
      flash[:notice] = "Unable to create a new quiz."
      render :new
    end
  end
  
  def edit
    @quiz = Quiz.find params[:id]
  end
  
  def update
    @quiz = Quiz.find params[:id]
    if @quiz.update_attributes params[:quiz]
        redirect_to user_courses_path(current_user)
     else
        render :edit
     end
  end
  
  def delete
     Quiz.find(params[:id]).destroy
     redirect_to user_courses_path(current_user)
  end
  
  def activate
    @quiz = Quiz.find params[:id]
    params[:quiz] = {:active => true}
    @quiz.update_attributes params[:quiz]
    redirect_to user_quiz_path(current_user, @quiz)
  end
  
end
