require 'spec_helper'

describe QuizzesController do
  let(:course) { create(:course) }
  let(:teacher) { create(:teacher) }
  let(:student) { create(:student, :course => course) }
  let(:quiz) { create(:quiz) }
  
  # after(:each) do
  #   DatabaseCleaner.clean
  # end
  
  describe "#index" do
    context "a user without authorization" do
      it "should get redirected to login path" # do
      #         teacher1
      #         session[:user_id] = nil
      #         visit user_quizzes_path(1)
      #         page.should redirect_to new_user_path
      #       end
    end
    
    context "a student" do
      it "should see all quizzes" do
        teacher1
        quiz
        student
        visit user_quizzes_path(student)
        page.should have_content ("Just a quiz")
      end
      
      it "should not see quizzes of other teachers"
      
    end
    context "a teacher" do
      
      it "should see all quizzes initialized by him"
      it "should not see quizzes of other teachers"
      
    end
  end
  
end