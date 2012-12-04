class Answer < ActiveRecord::Base
  attr_accessible :text, :correct, :question, :responses
  
  has_many :responses, :dependent => :destroy
  
  belongs_to :question
  
  validates :text, :presence => true
  #validates :question, :presence => true
end