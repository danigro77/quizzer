class Response < ActiveRecord::Base
  attr_accessible :score, :user, :answer, :quiz
  
  before_save :get_score
  
  validates :user, :presence => true
  validates :answer, :presence => true
  validates :quiz, :presence => true

  belongs_to :user   
  belongs_to :answer
  belongs_to :quiz
    
  private 
  
  def get_score
    self.score = answer.correct? ? 1 : 0
  end

end