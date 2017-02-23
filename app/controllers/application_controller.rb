class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    @@easy_words = []
    @@medium_words = []
    @@hard_words = []
    @@count = 1

  # attr_accessor :easy_words, :medium_words, :hard_words
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

  def is_all_words_loaded?
    !@@easy_words.empty? || !@@medium_words.empty? || !@@hard_words.empty?
  end 

  def api_call(difficulty)
    p "*" * 100
    @@count += 1 
    p @@count 
    p "*" * 100
    url = "http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words?difficulty=#{difficulty}&minLength=5"
    HTTParty.get(url).split(/#{DELIMITER}/)
  end 

  def get_all_words
    difficulty = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    difficulty.each do |difficult|
      if difficult <= 3
        @@easy_words << api_call(difficult)
      elsif difficult >= 8
        @@hard_words << api_call(difficult)
      else 
        @@medium_words << api_call(difficult)
      end 
    end 
      @@easy_words = @@easy_words.flatten.shuffle
      @@medium_words = @@medium_words.flatten.shuffle
      @@hard_words = @@hard_words.flatten.shuffle
  end 

  def self.sample_easy_words
    @@easy_words.sample
  end 

  def self.sample_medium_words
    @@medium_words.sample
  end 

  def self.sample_hard_words
    @@hard_words.sample
  end 

      # url = "http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words?difficulty=#{difficult}&minLength=5"
      # @response HTTParty.get(url).split(/#{DELIMITER}/).shuffle.sample


# set helper methods
  helper_method :current_user, :winner?, :loser?, :add_win_count, :add_lose_count
  
end
