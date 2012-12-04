class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :role, :teacher_id, :quizzes, :responses, :teacher, :students
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password,  :length => { :minimum => 6 }
  validates :email,     :presence => true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }
  validates :name,      :presence => true, :length => { :maximum => 20 }
  validates :role,      :presence => true, :inclusion => { :in => %w(teacher student), :message => "%{value} is not a valid role" }

  has_many  :quizzes          # ONLY users with role=teacher
  has_many  :questions
  has_many  :responses
  has_many  :students, :class_name => "User" , :foreign_key => :teacher_id            # ONLY users with role=student
  belongs_to :teacher, :class_name => "User"                                          # ONLY users with role=student
  

  
  def question_for_quiz(quiz)
    quiz.questions.where(:user_id => self.id).first    
  end  

  def student?
    self.role == "student"
  end

  def teacher?
    self.role == "teacher"
  end

  def created_one_question_for?(quiz)
    quiz.questions.map(&:user).include?(self)
  end
  
end