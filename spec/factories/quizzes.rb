require 'factory_girl'

FactoryGirl.define do

  factory :quiz_with_teacher_id_1, class: Quiz do
    name          "A Quiz Teacher"
    num_answers   4
    active        false
    user_id       1
  end
 
end