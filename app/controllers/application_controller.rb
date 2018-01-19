class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# checks to see if there's a current_user present
# @return - user object 
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

# checks to see if the user has won the game
# @return - true or false boolean
  def winner?
    @game.win
  end 

# checks to see if the user has lost the game
# @return - true or false boolean
  def loser?
    @game.lose
  end 

# checks to see if there's a current user & a winner
# increments the games_won && games_played count for existing, logged in users
# saves the current_user object without going through validations
  def add_win_count
    if winner? && current_user
      @current_user = current_user
      @current_user.increment_win
      @current_user.save(validate: false)
    end 
  end 

# checks to see if there's a current user & a loser
# increments the games_won && games_played count for existing, logged in users
# saves the current_user object without going through validations
  def add_lose_count
    if loser? && current_user
      @current_user = current_user
      @current_user.increment_loss
      @current_user.save(validate: false)
    end 
  end 

# raises an error if not found 
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

# set helper methods
  helper_method :current_user, :winner?, :loser?, :add_win_count, :add_lose_count
  
end
