require 'factory_girl'

FactoryGirl.define do
   
   factory :teacher, class: User, aliases: [:user] do 
     name                   "Factory Teacher"
     email                  "factory@teacher.com"
     password               "secure"
     password_confirmation  "secure"
     role                   "teacher"
     school_id              1
     # association :school, factory: :school
   end
   
   factory :student, class: User do
      name                    "Factory Student"
      email                   "factory@student.com"
      password                "secure"
      password_confirmation   "secure"
      role                    "student"
      school_id               1
      # association :school, factory: :school
   end
   
  
end