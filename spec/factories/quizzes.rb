require 'factory_girl'

FactoryGirl.define do

  factory :quiz, class: Quiz do
    name          "Just a quiz"
    num_answers   4
    active        false
    course_id     1
  end
 
end