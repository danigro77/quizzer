require 'factory_girl'

FactoryGirl.define do
   
  factory :course, class: Course do
    name          "Example Course"
    description   "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"
    start_date    "2011-12-13"
    end_date      "2012-1-14"
    teacher_id    1
    school_id     1
  end
  
end