require 'spec_helper'

describe Quiz do
  let(:my_quiz){ Quiz.create(:name => "Some awesom Quiz", :num_answers => 4 ) }
  
  describe "validation" do
    it "should be valid" do
      my_quiz.should be_valid
    end
    
    context "#name" do
      it "schould be false if not present" do
        my_quiz.name = ""
        my_quiz.should_not be_valid
      end
    end
    context "#num_answers" do
      it "schould be false if not present" do
        my_quiz.num_answers = ""
        my_quiz.should_not be_valid
      end
    end
    context "#active" do
      it "should has false as default value" do
        my_quiz.active.should be_false
      end
      it "should not be nil" do
        my_quiz.active.should_not be_nil
      end
      it "should be true if set to true" do
        my_quiz.active = true
        my_quiz.active.should be_true
      end
    end
  end
end