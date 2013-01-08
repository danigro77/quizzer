require 'factory_girl'

FactoryGirl.define do
   
  factory :excuse, class: Excuse do
    reason    "Flu"
    user_id   1
    quiz_id   1
  end
  
end