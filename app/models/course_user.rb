class CourseUser < ActiveRecord::Base
  self.table_name = "courses_users"
  attr_accessible :overall_score
  
  belongs_to :course
  belongs_to :user
  
  
end