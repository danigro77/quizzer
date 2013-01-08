class SchoolsController < ApplicationController
  skip_filter :authenticated?, :only => [:new, :create]
  
  def show
    @school = School.find current_user.school
  end
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new params[:school]
    if @school.save
      redirect_to new_user_path
    else
      flash[:notice] = "Unable to create this school."
      render :new
    end
  end
  
  def edit 
    @school = School.find current_user.school
  end
  
  def update
    @school = School.find current_user.school
    if @school.update_attributes params[:school]
      redirect_to root_path
    else
      flash[:notice] = "Unable to edit the school."
      render :edit  
    end
  end
  
end