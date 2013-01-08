class Quiz < ActiveRecord::Base
  MIN_ANSWERS = 2
  MAX_ANSWERS = 6

  attr_accessible :name, :num_answers, :active, :questions, :responses, :course, :course_id, :excuses
  
  validates :name, :presence => true
  validates :num_answers, :numericality => {:only_integr => true, :greater_than_or_equal_to => MIN_ANSWERS, :less_than_or_equal_to => MAX_ANSWERS}

  belongs_to :course   
  
  has_many :questions, :dependent => :destroy  
  has_many :responses
  has_many :excuses

  def num_excused
    excuses.count
  end
  
  def active?
    active
  end
  
  def taken?(user)        #TODO - find a way to check for taken quiz
    responses.where("user_id = ?", user).count > 0
  end
  
  def students
    course.users.where(:role => "student")
  end
  
  def teachers
    course.users.where(:role => "teacher")
  end
  
  def members
    course.users
  end
  
  def all_questions_created?
    questions.count == (course.users.count - num_excused)
  end
  
  def status_questions
    "#{self.questions.count}/#{count_all_questions}"
  end
  
  def count_all_questions
    course.users.count
  end
  
  def student_score(student, sum = 0)
    student_responses = responses.where("user_id = ?", student)
    student_responses.each { |response| sum += response.score }
    "#{sum}/#{count_all_questions}"
  end
  
  def sum_all_user_score(sum = 0)
    responses.each { |response| sum += response.score }
    sum
  end
  
  def average_score
    if students.empty?
      "(no)"
    else
      "#{sum_all_user_score/students.count}/#{count_all_questions}"
    end
  end
  
  def sum_all_taken_quizzes
    if students.empty?
      "(no)"
    else
      "#{responses.count/students.count}/#{students.count}"
    end
  end
  
  def date(user)
    timestamp = responses.where("user_id = ?", user).first.created_at
    "#{timestamp.month}/#{timestamp.day}/#{timestamp.year}"
  end
  

  # def method 
  # 
  #   questions.where(:user_id => user.id).first
  # end

end