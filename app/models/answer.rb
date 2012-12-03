class Answer < ActiveRecord::Base
  attr_accessible :text, :correct, :question, :responses
  
  has_many :responses, :dependent => :destroy
  
  belongs_to :question
  
  validates :text, :presence => true
  validates :question_id, :presence => true
  validates_presence_of :correct
end