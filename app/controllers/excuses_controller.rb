class ExcusesController < ApplicationController
  
  def new
    @quiz = Quiz.find params[:quiz_id]
    @excuse = @quiz.excuses.build
  end
  
  def create
    @quiz = Quiz.find params[:id]
    @excuse = @quiz.excuses.build params[:excuse]
  end
  
end