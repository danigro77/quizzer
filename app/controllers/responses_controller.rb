class ResponsesController < ApplicationController

  def new                               
    @quiz = Quiz.find params[:quiz_id]
    @quiz.questions.length.times do
      @response = current_user.responses.build
    end
  end
  
  def create
    answers = Answer.find params[:answer_ids].values
    answers.each { |a| current_user.responses.build(:answer => a).save }
    redirect_to root_url
  end

end