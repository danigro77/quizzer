class Question < ActiveRecord::Base
  attr_accessible :text, :user, :quiz, :answers, :answers_attributes
  
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers
  
  belongs_to :user
  belongs_to :quiz
  
  validates :text, :presence => true
  validates :user, :presence => true
  validates :quiz, :presence => true
  validate  :has_correct_number_of_answers
  validate  :has_one_and_only_one_correct_answer

  has_one :correct_answer,
          :class_name => 'Answer',
          :conditions => Answer.correct.where_values_hash
  
  def answers_to_build
  	self.quiz.num_answers - self.answers.count
  end
  
  def has_correct_number_of_answers
    # Best practice: always use size
    # See http://blog.hasmanythrough.com/2008/2/27/count-length-size
    unless self.answers.size == self.quiz.num_answers
      errors.add(:answers, "This quiz must have #{self.quiz.num_answers} answers. Please fill out all the answer.")
    end
  end
  
  def has_one_and_only_one_correct_answer
    # We can't hit the DB here because the answer isn't in the DB yet
    unless self.answers.select(&:correct?).size == 1
      errors.add(:answers, "You must have one (and only one) correct answer.")
    end
  end  
end