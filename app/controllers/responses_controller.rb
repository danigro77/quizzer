class ResponsesController < ApplicationController

  def new                               
    if is_teacher?(current_user)
      @quiz = Quiz.find_by_user_id(current_user)
    elsif is_student?(current_user)
      @quiz = Quiz.find_by_user_id(current_user.teacher)
    end
    questions = @quiz.questions.all
    questions.length.times do
      @response = current_user.responses.build
    end
  end
  
  def create
    
  end

end