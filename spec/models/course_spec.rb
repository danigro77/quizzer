require "spec_helper"

describe Course do
  let(:school)  { create(:school) }
  let(:teacher) { create(:teacher) }
  let(:course)  { create(:course, :teacher => teacher, :school => school) }
  
  describe "validation" do
    it "has a valid factory" do
      course.should be_valid
    end
    
    context "#name" do
      it "is invalid without a name" do
        course.name = nil
        course.should_not be_valid
      end
    end
    
    context "#description" do
      it "is valid without a description" do
        course.description = nil
        course.should be_valid
      end
    end
    
    context "#dates" do
      it "is invalid without a start_date" do
        course.start_date = nil
        course.should raise_error
      end
      it "is invalid without an end_date" do
        course.end_date = nil
        course.should raise_error
      end
      it "has an earlier start_date than end_date" do
        course.end_date = Date.today
        course.start_date = course.end_date + 2.days
        course.should_not be_valid
      end
    end
    
    context "#teacher" do
      it "is invalid without a teachers id" do
        course.teacher = nil
        course.should_not be_valid
      end
    end
    
    context "#school" do
      it "is invalid without a schools id" do
        course.school = nil
        course.should_not be_valid
      end
    end
  end
  
  describe "methods" do
    context "#description_short" do
      it "shortens a description when it is longer than 30 characters" do
        course.description_short.length.should == 30 + " ...".length
      end
    end
  end
  
end