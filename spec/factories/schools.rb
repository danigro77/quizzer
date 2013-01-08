require 'factory_girl'

FactoryGirl.define do
   
   factory :school, class: School do
     name       "Example School"
     address_1  "2314 Example Lane"
     address_2  "Suite 200"
     city       "Exampolis"
     state      "CA"
     zip        12345
     country    "USA"
     url        "http://www.example-school.edu"
     email      "example_teacher@school.com"
     contact    "Hans Example"
   end
   
 end