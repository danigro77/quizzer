class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_quizzes_path(user), :notice => "Welcome back, #{user.name}!"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Bye!"
  end
  
end