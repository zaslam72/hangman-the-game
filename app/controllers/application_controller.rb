class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  DELIMITER = "\n"
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

  def get_all_words
    difficulty = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    difficulty.each do |difficult|
      url = "http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words?difficulty=#{difficult}&minLength=5"
        @@easy_words = []
        @@medium_words = []
        @@hard_words = []
      if difficult <= 3
        @@easy_words << HTTParty.get(url).split(/#{DELIMITER}/)
      elsif difficult >= 8
        @@medium_words << HTTParty.get(url).split(/#{DELIMITER}/)
      else 
        @@hard_words << HTTParty.get(url).split(/#{DELIMITER}/)
      end 
    end 
       @@easy_words.flatten.shuffle
       @@medium_words.flatten.shuffle
       @@hard_words.flatten.shuffle
  end 

# set helper methods
  helper_method :current_user, :winner?, :loser?, :add_win_count, :add_lose_count
  
end
