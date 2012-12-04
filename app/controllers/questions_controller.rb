class QuestionsController < ApplicationController
  before_filter :load_quiz
  before_filter :can_add_question?, :only => [:new, :create]
  
  def new
    @question = @quiz.questions.build
    @question.answers_to_build.times { @question.answers.build }
  end
  
  def create
    @question = @quiz.questions.build params[:question]
    @question.user = current_user
    if @question.save                                     # TODO: Does not save
      redirect_to user_quizzes_path(@quiz.user_id)
    else
      flash[:notice] = "Unable to create a new question."
      render :new                                           # TODO: creates two new answers
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes params[:question]
      redirect_to user_quizzes_path(@quiz.user_id)
    else
      flash[:notice] = "Unable to edit the question."
      render :edit  
    end
  end

  private

  def load_quiz
    @quiz = Quiz.find params[:quiz_id]
  end

  def can_add_question?
    redirect_to user_quizzes_path(current_user) if current_user.created_one_question_for? @quiz
  end
  
end