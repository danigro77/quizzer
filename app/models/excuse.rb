class Excuse < ActiveRecord::Base
  attr_accessible :user, :quiz, :reason
  
  validates :user, :presence => true
  validates :quiz, :presence => true

  belongs_to :user
  belongs_to :quiz
  
end