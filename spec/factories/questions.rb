require 'factory_girl'

FactoryGirl.define do
   
   factory :question, class: Question do 
     text       "Is this a question?"
     user_id    1
     quiz_id    1
   end
 end