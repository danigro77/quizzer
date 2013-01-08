class CoursesController < ApplicationController
  
  def index
    @courses = current_user.courses
  end
  
  def show
    @course = Course.find params[:id]
  end
  
  def new
    @course = current_user.courses.build
  end
  
  def create
    @course = current_user.courses.build params[:course]
    @course.school = current_user.school
    @course.teacher = current_user
    @course.start_date = "#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}"
    @course.end_date = "#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}"
    if @course.save
      current_user.courses << @course
      redirect_to user_courses_path(current_user)
    else
      flash[:notice] = "Unable to create a new course."
      render :new
    end
  end
  
  def attend
    @course = Course.find params[:id]
    @course.users << current_user unless current_user.a_member?(@course)
    params[:course] = {:users => @course.users}
    if @course.update_attributes params[:course]
      redirect_to school_path(current_user.school), :notice => "Completed!"
    else 
      redirect_to school_path(current_user.school), :error => "Whoops."
    end
  end
  
  def leave
    @course = Course.find params[:id]
    if @course.users.destroy(current_user)
      redirect_to user_courses_path(current_user)
    else
      flash[:notice] = "Unable to leave this course."
      redirect_to user_courses_path(current_user)
    end
  end
  
end