class QuestionsController < ApplicationController
  
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.new
    @quiz.num_answers.times { @question.answers.build }
  end
  
  def create
      @quiz = Quiz.find(params[:quiz_id])
      @question = @quiz.questions.new params[:question])
      @question.user_id = @quiz.user_id
      # @question.save
      @quiz.num_answers.times do |i|
        @question.answers.build params[:answer[i]]
        if i == 0
          @question.answers[i].correct = true
        else
          @question.answers[i].correct = false
        end
      end
 p @question
 p @question.answers
      if @question.save                                     # TODO: Does not save
p "I'm here"
        @question.answers.save
        redirect_to user_quizzes_path(@quiz.user_id)
      else
        flash[:notice] = "Unable to create a new question."
        render :new                                           # TODO: creates two new answers
      end
  end
  
end