require 'spec_helper'

describe User do
  before(:all) do
    User.destroy_all
  end
  let(:valid_teacher) {User.create!(:name => "Test Teacher", :email => "test@teacher.com", :role => "teacher", :password => "foobar", :password_confirmation => "foobar")}
  let(:valid_student) {User.create!(name: "Test Student", email: "test@student.com", role: "student", password: "foobar", password_confirmation: "foobar", :teacher_id => valid_teacher.id)}

  describe "validation" do
    context "#password" do
      it "should be false when there is no password" do
        user = User.new(:name => "Test Teacher", :email => "test@teacher.com", :role => "teacher")
        user.should_not be_valid
      end
      
      it "should be true when there is a password" do
        valid_teacher.should be_valid
        valid_student.should be_valid
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
        user = User.new(:name => "Some Teacher", :email => valid_teacher.email, :role => "teacher", :password => "foobar", :password_confirmation => "foobar")  
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
  
  describe "relations" do
    
    it "#teachers_id: a student has many teachers" do
      valid_teacher.should eq valid_student.teacher
    end
  end
  
end