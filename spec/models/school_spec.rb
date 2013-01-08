require "spec_helper"

describe School do
  let (:school) { create(:school) }
  
  describe "validation" do
    
    it "has a valid factory" do
      school.should be_valid
    end
    
    context "#name" do
      it "should be invalid without a name" do
        school.name = nil
        school.should_not be_valid
      end
    end
    
    context "#address" do
      it "should be invalid without address line 1" do
        school.address_1 = nil
        school.should_not be_valid
      end
      
      it "should be valid without address line 2" do
        school.address_2 = nil
        school.should be_valid
      end
    end
    
    context "#city" do
      it "should be invalid without a city" do
        school.city = nil
        school.should_not be_valid
      end
    end
    
    context "#state" do
      it "should be valid without a state" do
        school.state = nil
        school.should be_valid
      end
    end
    
    context "#zip" do
      it "should be invalid without a zip code" do
        school.zip = nil
        school.should_not be_valid
      end
    end
    
    context "#country" do
      it "should be invalid without a country" do
        school.country = nil
        school.should_not be_valid
      end
    end
    
    context "#url" do
      it "should be invalid without a url" do
        school.url = nil
        school.should_not be_valid
      end
      
      it "should be invalid when the url is taken" do
        school
        another_school = FactoryGirl.build(:school, :email => "someone@else.com")
        another_school.should_not be_valid
      end
      
      it "should be invalid when it is not a url" do
        ["school", "school.com", "school@com", "ffh://school.com", "http:/school.com"].each do |invalid_url|      
          school.url = invalid_url
          school.should_not be_valid
        end  
      end
      
      it "should be valid when it has an url format" do
        ["http://school.com", "https://school.com", "http://www.my-school.com"].each do |valid_url|
          school.url = valid_url
          school.should be_valid
        end
      end
    end
    
    context "#email" do
      it "should be invalid without an email" do
        school.email = nil
        school.should_not be_valid
      end
      
      it "should be invalid when the email is taken" do
        school
        another_school = FactoryGirl.build(:school, :url => "http://www.someone_else.com")
        another_school.should_not be_valid
      end
      
      it "should be invalid when it is not an email" do
        ["teacher", "teacher.com", "teacher@com@com", "teacher@com"].each do |invalid_email|
          school.email = invalid_email
          school.should_not be_valid
        end    
      end
      
      it "should be valid when it has an email format" do
        ["teacher@email.com", "teacher@test.edu.com", "some_teacher@school.com"].each do |valid_email|
          school.email = valid_email
          school.should be_valid
        end
      end
    end
    
    context "#contact" do
      it "should be invalid without a contact name" do
        school.contact = nil
        school.should_not be_valid
      end
    end
    
  end
  
end