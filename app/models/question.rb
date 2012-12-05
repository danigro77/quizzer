class Question < ActiveRecord::Base
  attr_accessible :text, :user, :quiz, :answers, :answers_attributes
  
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers
  
  belongs_to :user
  belongs_to :quiz
  
  validates :text, :presence => true
  validates :user, :presence => true
  validates :quiz, :presence => true
  validate  :correct_num_answers


  def answers_to_build
  	self.quiz.num_answers - self.answers.count
  end
  
  def correct_num_answers
     self.answers.count == self.quiz.num_answers
  end
  
  def first_answer_correct
    self.answers.first.correct = true
    self.update
  end
end