class Quiz < ActiveRecord::Base
  attr_accessible :name, :num_answers, :active, :user, :questions, :responses
  
  validates :name, :presence => true
  validates :num_answers, :presence => true
  validates :user, :presence => true
  validate  :valid_user

  belongs_to :user   
  
  has_many :questions, :dependent => :destroy  
  has_many :responses

  def valid_user
    errors.add(:quiz, "- Only teachers are allowed to initiate quizzes.") unless self.user.role == "teacher"
  end
  
  def self.active?
    self.active
  end
  
  def taken?(user)        #TODO - find a way to check for taken quiz
    self.responses.where("user_id = ?", user).count > 0
  end
  
  def all_questions?
    self.questions.count == User.find(self.user).students.count + 1
  end
  
  def status_questions
    "#{self.questions.count}/#{count_all_questions}"
  end
  
  def count_all_questions
    if self.user.role == "teacher"
      User.find(self.user).students.count + 1
    elsif self.user.role == "student"
      User.find(self.user.teacher).students.count + 1
    end
  end
  
  def activate
    self.active = true
    self.update
  end
  
  def user_score(user, sum = 0)
    user_responses = self.responses.where("user_id = ?", user)
    p user_responses
    user_responses.each { |response| sum += response.score }
    "#{sum}/#{count_all_questions}"
  end
  
  def date
    timestamp = self.responses.where("user_id = ?", self.user).first.created_at
    "#{timestamp.month}/#{timestamp.day}/#{timestamp.year}"
  end

end