require 'factory_girl'

FactoryGirl.define do
   
   factory :answer, class: Answer do
     sequence(:text)  { |n| "Answer ##{n}}" }  
     question_id      1
   end
   
 end