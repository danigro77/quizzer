class SchoolsController < ApplicationController
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new params[:school]
    if @school.save
      redirect_to root_path
    else
      flash[:notice] = "Unable to create this school."
      render :new
    end
  end
  
  def edit 
    @school = School.find params[:id]
  end
  
  def update
    @school = School.find params[:id]
    if @school.update_attributes params[:school]
      redirect_to root_path
    else
      flash[:notice] = "Unable to edit the schooln."
      render :edit  
    end
  end
  
end