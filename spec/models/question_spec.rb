require 'spec_helper'

describe Question do
  before :all do
    answers = []
    4.times do |i|
      answers << FactoryGirl.create(:answer)
    end
  end
  
  let(:school)    { create(:school) }
  let(:teacher)   { create(:teacher) }
  let(:student)   { create(:student) }
  let(:course)    { create(:course, :teacher => teacher, :school => school) }
  let(:quiz)      { create(:quiz, :course => course) } 
  let(:question)  { create(:question, :quiz => quiz, :user => student, :answers => answers) }

  
  describe "validation" do
    it "has a valid factory" do
      question.should be_valid
    end
    
    context "#text" do
      it "should not be valid without a text" do
        question.text = nil
        question.should_not be_valid
      end
    end
    
    context "#user" do
      it "should not be valid without a user" do
        question.user = nil
        question.should_not be_valid
      end
    end
    
    context "#quiz" do
      it "should not be valid without a text" do
        question.quiz = nil
        question.should_not be_valid
      end
    end
    
    context "#has_correct_number_of_answers" do
      it "should not be valid when there is only one answer"# do
        
        #   question.should_not be_valid
        # end
      it "should not be valid when there are too many answers" #do
        
        #   question.should_not be_valid
        # end
    end
    
    context "#has_one_and_only_one_correct_answer" do
      it "should not be valid when there is no correct answer"# do
        
        #   question.should_not be_valid
        # end
      it "should not be valid when there are too many correct answers" #do
        
        #   question.should_not be_valid
        # end
    end
  end
  
  description "methods" do
    
    context "#answers_to_build" do
      it "returns the number of answers which are not build jet"
    end
  end
  
end