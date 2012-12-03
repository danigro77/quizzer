class Response < ActiveRecord::Base
  attr_accessible :score, :user, :answer
  
  before_save :get_score
  
  validates :user, :presence => true
  validates :answer, :presence => true

  belongs_to :user   
  belongs_to :answer
  
  has_one :score
  
  private 
  
    def get_score           # TODO check if work
      if answer.correct
        score = 1
      else
        score = 0
      end
    end

end