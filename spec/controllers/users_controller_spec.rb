require 'spec_helper'

describe UsersController do
  
  before(:each) do
    
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
      it "should redirect to the users quizzes" do
        post(:create, user: attributes_for(:teacher))
        response.should be_redirect
      end
      it "should create a new record in the database" do
        user = User.create(attributes_for(:teacher))
        user.should be_persisted
      end
    end
    
    context "with invalid information" do
      it "should re-render the new user template" do
        post(:create, user: attributes_for(:teacher, :email => ""))
        response.should render_template :new
      end
      it "should create no new record in the database" do
        user = User.create(attributes_for(:teacher, :email => ""))
        user.should_not be_persisted
      end
    end
  end
  
end