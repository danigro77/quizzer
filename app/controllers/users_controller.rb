class UsersController < ApplicationController
  skip_filter :authenticated?
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Welcome #{@user.name}"
      session[:user_id] = @user.id
      redirect_to user_quizzes_path(@user)
    else
      render :new
    end
  end

  
end