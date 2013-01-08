class Course < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :teacher, :school, :users, :quizzes
  
  validates :name,        :presence => true
  validates :start_date,  :presence => true
  validates :end_date,    :presence => true
  validates :school_id,   :presence => true
  validates :teacher_id,  :presence => true
  # validate  :unique_course_user_combo
  validate  :time_span
  
  has_many    :quizzes
  has_many    :course_users
  has_many    :users, :through => :course_users
  belongs_to  :teacher, :class_name => "User"
  belongs_to  :school
  
  def description_short
    description.length > 30 ? "#{description[0...30]} ..." : description
  end
  
  # def unique_course_user_combo
  #   errors.add(:users, "You allready attend this course")
  #   self.users.count > self.users.uniq.count
  # end
  
  def time_span
    unless start_date < end_date
      errors.add(:courses, "Please choose a time span longer than one day.")
    end
  end
  
end