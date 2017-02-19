class SessionsController < ApplicationController

  # get method for new session (get login form)
  def new
    respond_to do |format|
      format.js { render 'new' }
      format.html
    end
  end 

  # post method for creation of session (click log in)
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

  # delete method for deletion of session (logging out)
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end 

end