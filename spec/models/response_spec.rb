require "spec_helper"

describe Response do
  let(:school)      { create(:school) }
  let(:teacher)     { create(:teacher) }
  let(:student)     { create(:student) }
  let(:course)      { create(:course, :teacher => teacher, :school => school) }
  let(:quiz)        { create(:quiz, :course => course) }
  let(:c_answer)    { create(:answer, :correct => true) }
  let(:ic_answer)   { create(:answer) }
  let(:response)    { create(:response, :user => student, :answer => c_answer, :quiz => quiz) }
  let(:response_ic) { create(:response, :user => student, :answer => ic_answer, :quiz => quiz) }
  
  describe "validations" do
    
    it "has a valid factory" do
      response.should be_valid
    end
    
    context "#user" do
      it "is not valid without a user" do
        response.user = nil
        response.should_not be_valid
      end
    end
    
    context "#answer" do
      it "is not valid without a answer" do
        response.answer = nil
        response.should_not be_valid
      end
    end
    
    context "#quiz" do
      it "is not valid without a quiz" do
        response.quiz = nil
        response.should_not be_valid
      end
    end
  end
  
  describe "methods" do
    context "#get_score" do
      it "should set the score to 1 if the answer is correct"
      it "should set the score to 0 if the answer is not correct"
    end
  end
  
end