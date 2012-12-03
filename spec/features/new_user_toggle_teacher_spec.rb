require 'spec_helper'

describe "NewUser",  :js => true do
  describe "TeacherDropdown" do

    before(:each) do
      visit new_user_path
    end
    
    context "when teacher button is active" do
      it "should be hidden" do
        choose("teacher_radio")
        page.should_not have_content("Select your teacher")
      end
      it "should still be hidden after rendering the page" do
        choose("teacher_radio")
        click_on("Create User")
        page.should_not have_content("Select your teacher")
      end
    end
    context "when student button is active" do
      it "should be shown" do
        choose("student_radio")
        page.should have_content("Select your teacher")
      end
      it "should still be shown after rendering the page" do
        choose("student_radio")
        click_on("Create User")
        page.should have_content("Select your teacher")
      end
    end
  end
end