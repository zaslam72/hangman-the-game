class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# this method will check to see if there's a current_user present
# returns user object 
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

# this method will check to see if the user has won the game
# returns true or false
  def winner?
    @game.win
  end 

# this method will check to see if the user has lost the game
# returns true or false 
  def loser?
    @game.lose
  end 

# this method checks to see if there's a current user & a winner
# this method will increment the games_won && games_played count for existing, logged in users
# it will save the current_user object without going through validations
  def add_win_count
    if winner? && current_user
      @current_user = current_user
      @current_user.increment_win
      @current_user.save(validate: false)
    end 
  end 

# this method checks to see if there's a current user & a loser
# this method will increment the games_won && games_played count for existing, logged in users
# it will save the current_user object without going through validations
  def add_lose_count
    if loser? && current_user
      @current_user = current_user
      @current_user.increment_loss
      @current_user.save(validate: false)
    end 
  end 

# this method will raise an error if not found 
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

# set helper methods
  helper_method :current_user, :winner?, :loser?, :add_win_count, :add_lose_count
  
end
