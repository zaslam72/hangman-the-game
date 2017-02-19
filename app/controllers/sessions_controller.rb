class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.js { render 'new' }
      format.html
    end
  end 

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = ["Email or password is incorrect."]
      render 'new'
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end 

end