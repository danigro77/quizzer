class QuizzesController < ApplicationController
  
  def index
    @quizzes = Quizzes.find(current_user)
  end
  
end