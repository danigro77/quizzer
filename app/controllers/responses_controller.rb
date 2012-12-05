class ResponsesController < ApplicationController

  def new                               
    @quiz = Quiz.find params[:quiz_id]
    @quiz.questions.length.times do
      @response = current_user.responses.build
    end
  end
  
  def create
    answers = Answer.find params[:answer_ids].values
    responses = []
    answers.each do |a| 
      responses << current_user.responses.build(:answer => a)
    end
    responses.each do |r|
      r.quiz = Quiz.find(params[:quiz_id])
      
      r.save
    end
    redirect_to user_quizzes_path(current_user)
  end

end