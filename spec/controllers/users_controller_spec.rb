require 'spec_helper'

describe UsersController do
  
  def valid_attributes
    {:name => "Test User", :email => "test@user.com", :password => "foobar", :password_confirmation => "foobar"}
  end
  def valid_session
  end
  
  describe "#new" do
    it "assigns a new user" do
      get(:new)
      assigns(:user).should be_an_instance_of(User)
      assigns(:user).should be_new_record
    end
  end
  
  describe "#create" do
    context "with valid information" do
      it "should redirect to the users quizzes"
      it "should create a new record in the database"
    end
    
    context "with invalid information" do
      it "should re-render the new user template"
      it "should create no new record in the database"
    end
  end
  
end