class UsersController < ApplicationController
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Welcome #{@user.name}"
      redirect_to user_quizzes_path(@user)
    else
      render :new
    end
  end

  
end