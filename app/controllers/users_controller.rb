class UsersController < ApplicationController
  
  def new
    @user = User.new
    @teachers = User.where(:role => "teacher")
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Welcome #{@user.name}"
      redirect_to user_quizzes_path(@user)
    else
      @teachers = User.where(:role => "teacher")
      render :new
    end
  end

  
end