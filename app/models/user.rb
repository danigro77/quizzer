class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :role, :courses,
                  :quizzes, :responses, :school, :school_id
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password,  :length => { :minimum => 6 }
  validates :email,     :presence => true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }
  validates :name,      :presence => true, :length => { :maximum => 20 }
  validates :role,      :presence => true, :inclusion => { :in => %w(teacher student), :message => "%{value} is not a valid role" }
  validates :school_id, :presence => true
  
  has_many    :quizzes
  has_many    :questions
  has_many    :responses

  has_many    :course_users

  has_many    :courses,
              :through => :course_users

  has_many    :contributable_quizzes,
              :through => :courses,
              :source => :quizzes

  belongs_to  :school

  def question_for_quiz(quiz)
    quiz.questions.where(:user_id => self.id).first  
  end  

  def student?
    self.role == "student"
  end

  def teacher?
    self.role == "teacher"
  end
  
  def is_allowed_to_edit_question?(quiz)
    # only the user who created the question is allowed to edit it
    quiz.questions.map(&:user).include?(self)
  end

  def a_member?(course)
    course.users.include?(self)
  end
  
  def courses_created_by_himself
    courses.where(:teacher_id => self.id)
  end
  
end