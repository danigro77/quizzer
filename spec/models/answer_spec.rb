require "spec_helper"

describe Answer do
  let(:answer) { create(:answer) }
  
  describe "validation" do
    it "has a valid factory" do
      answer.should be_valid
    end
    
    context "#text" do
      it "is invalid when text is missing" do
        answer.text = nil
        answer.should_not be_valid
      end
    end
    
    context "#correct" do
      it "is by default false" do
        answer.correct.should be_false
      end
    end
  end
  
  describe "methods" do
    context "#self.correct" do
      
    end
  end
  
end