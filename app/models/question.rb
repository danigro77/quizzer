class Question < ActiveRecord::Base
  attr_accessible :text, :user, :quiz, :answers, :answers_attributes
  
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers
  
  belongs_to :user
  belongs_to :quiz
  
  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :quiz_id, :presence => true
end