class Response < ActiveRecord::Base
  attr_accessible :score, :user, :answer
  
  before_save :get_score
  
  validates :user, :presence => true
  validates :answer, :presence => true

  belongs_to :user   
  belongs_to :answer
    
  private 
  
  def get_score
    self.score = answer.correct? ? 1 : 0
  end

end