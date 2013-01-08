require "spec_helper"

describe Excuse do
  let(:school)        { create(:school) }
  let(:teacher)       { create(:teacher) }
  let(:student)       { create(:student) }
  let(:course)        { create(:course, :teacher => teacher, :school => school) }
  let(:quiz)          { create(:quiz, :course => course) }
  let(:excuse)        { create(:excuse, :user => student, :quiz => quiz) }

   describe "validation" do
     it "has a valid factory" do
       excuse.should be_valid
     end
     
     context "#user" do
       it "should not be valid without a user" do
         excuse.user = nil
         excuse.should_not be_valid
       end
     end
     
     context "#quiz" do
        it "should not be valid without a quiz" do
          excuse.quiz = nil
          excuse.should_not be_valid
        end
      end
   end
  
end