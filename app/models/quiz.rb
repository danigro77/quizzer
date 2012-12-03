class Quiz < ActiveRecord::Base
  attr_accessible :name, :num_answers, :active, :user, :questions
  
  validates :name, :presence => true
  validates :num_answers, :presence => true
  validates :user, :presence => true
  validate  :valid_user

  belongs_to :user   
  
  has_many :questions, :dependent => :destroy    

  def valid_user
    errors.add(:quiz, "- Only teachers are allowed to initiate quizzes.") unless self.user.role == "teacher"
  end
  
  def created_one_question?(current_user)
    self.questions.map(&:user).include?(current_user)
  end
  
  def self.active?
    self.active
  end
  

end