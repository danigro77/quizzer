class UsersController < ApplicationController
  skip_filter :authenticated?, :except => [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Welcome #{@user.name}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @user = User.find current_user
  end
  
  def update
    @user = User.find current_user
    if @user.update_attributes params[:user]
      redirect_to root_path
    else
      render :edit
    end
  end
end
