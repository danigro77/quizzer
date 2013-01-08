require 'factory_girl'

FactoryGirl.define do
   
   factory :response, class: Response do
     score        nil
     user_id      1
     answer_id    1
     quiz_id      1
   end
   
 end