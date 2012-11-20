class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :role
  
  validates :password,  :presence => true
  validates :email,     :presence => true, :uniqueness => true
  validates :name,      :presence => true
  validates :role,      :presence => true, :inclusion => { :in => %w(teacher student), :message => "%{value} is not a valid role" }

  has_many  :quizzes
  has_many  :questions
  has_many  :responses
  
end