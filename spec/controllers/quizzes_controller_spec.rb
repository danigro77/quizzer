require 'spec_helper'

describe QuizzesController do
  
  describe "#index" do
    context "a user without authorization"
      it "should get redirected to login path"
    end
    context "a student" do
      it "should see all quizzes of his teacher"
    end
    context "a teacher" do
      it "should see all quizzes initialized by him"
    end
  end
  
end