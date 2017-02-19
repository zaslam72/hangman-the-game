class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :friendship, :destroy]

# get method for all users
# get a list of users who have played at least one game
# order them in descending order of win rate
  def index
    @users = User.where('games_played > ?', 0).order('games_won / games_played DESC')
  end 

# get method for new user form (sign up form)
  def new
    @current_user = User.new
    respond_to do |format|
      format.js { render 'new' }
      format.html 
    end 
  end 

# post method for creating a new user (click sign up button)
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

# get method for user profile page 
# stores all the user's games in an instance variable 
  def show
    @games = @current_user.games
  end 

# post method for friendship creation
# called when someone clicks on "Add Friend"
# redirects to current_user profile page 
  def friendship
    @friendship = Friendship.create!(user_id: @current_user.id, friend_id: @user.id)
    redirect_to user_path(@current_user)
  end 

# delete method for ending friendships
# called when someone clicks on "Unfriend"
# redirects to current_user profile page 
  def destroy
    @friendship = Friendship.where(user_id: @current_user.id, friend_id: @user.id)
    @friendship[0].destroy
    redirect_to user_path(@current_user)
  end 

private 

# this method ensures that the user is passing in valid params(strings)
# protection against passing in viruses through forms 
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

# this method is called in the before_action for any action that has a user object
# it's duty is to store the object in an instance variable
# I included it here to make my code DRY
  def set_user 
    @current_user = current_user
    @user = User.find(params[:id])
  end 

end