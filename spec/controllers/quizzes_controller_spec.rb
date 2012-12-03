require 'spec_helper'

describe QuizzesController do
  let(:teacher1) { create(:teacher) }
  let(:teacher2) { create(:teacher, :email => "another@teacher.com") }
  let(:student) { create(:student) }
  let(:quiz_with_teacher) { create(:quiz_with_teacher_id_1) }
  
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
      it "should see all quizzes of his teacher" do
        teacher1
        quiz_with_teacher
        student
        visit user_quizzes_path(student)
        page.should have_content ("Important Quiz Teacher")
      end
      it "should not see quizzes of other teachers"
    end
    context "a teacher" do
      it "should see all quizzes initialized by him"
      it "should not see quizzes of other teachers"
    end
  end
  
end