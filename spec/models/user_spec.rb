require 'spec_helper'

describe User do
  before(:all) do
    User.destroy_all
    School.destroy_all
  end
  
  let(:school)        { create(:school) }
  let(:valid_teacher) { create(:teacher, :school => school) }
  let(:valid_student) { create(:student, :school => school) }
  
  describe "validation" do
    it "has a valid factory" do
      valid_teacher.should be_valid
      valid_student.should be_valid
    end
    
    context "#password" do
      it "should be false when there is no password" do
        valid_teacher.password = nil
        valid_teacher.should_not be_valid
      end
      
      it "should be false when the password is too short" do
        valid_teacher.password = "foo"
        valid_teacher.password_confirmation = "foo"
        valid_teacher.should_not be_valid
      end
      
      it "should be false when the password and confirmation is different" do
        valid_teacher.password = "foobar"
        valid_teacher.password_confirmation = "barfoo"
        valid_teacher.should_not be_valid
      end
      
      it "should be false when the password_confirmation is missing" do
        valid_teacher.password_confirmation = ""
        valid_teacher.should_not be_valid
      end
    end
  
    context "#name" do
      it "should be false if it's missing" do
        valid_teacher.name = ""
        valid_teacher.should_not be_valid
      end
      it "should be false if it's too long" do
        valid_teacher.name = "a"*21
        valid_teacher.should_not be_valid
      end
    end
  
    context "#email" do
      it "should be present" do
        valid_teacher.email = ""
        valid_teacher.should_not be_valid
      end
      it "should be unique" do
        valid_teacher
        user = FactoryGirl.build( :teacher )
        user.should_not be_valid
      end
      it "should be false in a invalid format" do
        ["teacher", "teacher.com", "teacher@com@com", "teacher@com"].each do |invalid_email|
          valid_teacher.email = invalid_email
          valid_teacher.should_not be_valid
        end
      end
      it "should be true in a valid format" do
        ["teacher@email.com", "teacher@test.edu.com", "some_teacher@school.com"].each do |valid_email|
          valid_teacher.email = valid_email
          valid_teacher.should be_valid
        end
      end
    end
  
    context "#role" do
      it "should be present" do
        valid_teacher.role = ""
        valid_teacher.should_not be_valid
      end
      it "should only be 'student' or 'teacher'" do
        valid_teacher.role = "janitor"
        valid_teacher.should_not be_valid
      end
    end
  end
  
  describe "methods" do
    
    context "#student?" do
      it "returns true if a user is a student" do
        valid_student.student?.should be_true
      end
     
      it "returns false if a user is not a student" do
        valid_teacher.student?.should be_false
      end
    end
   
    context "#teacher?" do
      it "returns true if a user is a teacher" do
        valid_teacher.teacher?.should be_true
      end
      
      it "returns false if a user is not a teacher" do
        valid_student.teacher?.should be_false
      end
    end
   
  end
  
end