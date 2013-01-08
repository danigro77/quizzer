require 'spec_helper'

describe Quiz do
  let(:school)        { create(:school) }
  let(:teacher)       { create(:teacher) }
  let(:course)        { create(:course, :teacher => teacher, :school => school) }
  let(:inactive_quiz) { create(:quiz, :course => course) }
  let(:active_quiz)   { create(:quiz, :course => course, :active => true) }
  
  describe "validation" do
    it "should have a valid factory" do
      inactive_quiz.should be_valid
    end
    
    context "#name" do
      it "schould be false if not present" do
        inactive_quiz.name = ""
        inactive_quiz.should_not be_valid
      end
    end
    context "#num_answers" do
      it "should be false if not present" do
        inactive_quiz.num_answers = ""
        inactive_quiz.should_not be_valid
      end
      it "should be invalid with only one answer" do
        inactive_quiz.num_answers = 1
        inactive_quiz.should_not be_valid
      end
    end
    
    context "#active" do
      it "should has false as default value" do
        inactive_quiz.active.should be_false
      end
      it "should not be nil" do
        inactive_quiz.active.should_not be_nil
      end
      it "should be true if set to true" do
        # active_quiz = inactive_quiz.active = true
        active_quiz.active.should be_true
      end
    end
    
  end
  
  describe "methods" do
    
    context "#active?" do
      it "returns the active status of a quiz" do
        inactive_quiz.active?.should be_false
        active_quiz.active?.should be_true
      end
    end
    
  end
end