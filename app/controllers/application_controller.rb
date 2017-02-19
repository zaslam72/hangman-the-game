class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def winner?
    @game.user_word == @game.word
  end 

  def loser?
    @game.remaining_guesses == 0
  end 

  def add_win_count
    if winner? && current_user
      @current_user = current_user
      @current_user.games_won += 1
      @current_user.games_played += 1
      @current_user.save(validate: false)
    end 
  end 

  def add_lose_count
    if loser? && current_user
      @current_user = current_user
      @current_user.games_lost += 1
      @current_user.games_played += 1
      @current_user.save(validate: false)
    end 
  end 


  helper_method :current_user, :winner?, :loser?, :add_win_count, :add_lose_count
  
end
