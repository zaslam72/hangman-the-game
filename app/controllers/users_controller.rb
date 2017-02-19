class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :friendship, :destroy]

  def index
    @users = User.where('games_played > ?', 0).order('games_won / games_played DESC')
  end 

  def new
    @current_user = User.new
    respond_to do |format|
      format.js { render 'new' }
      format.html 
    end 
  end 

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      @errors = @current_user.errors
      render 'new'
    end
  end 

  def show
    @games = @current_user.games
  end 

  def friendship
    @friendship = Friendship.create!(user_id: @current_user.id, friend_id: @user.id)
    redirect_to user_path(@current_user)
  end 

  def destroy
    @friendship = Friendship.where(user_id: @current_user.id, friend_id: @user.id)
    @friendship[0].destroy
    redirect_to user_path(@current_user)
  end 

private 
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  def set_user 
    @current_user = current_user
    @user = User.find(params[:id])
  end 

end