class User < ApplicationRecord
  # set bcrypt
  has_secure_password
  
# set associations
  has_many :games
  has_many :friendships
  has_many :friends, through: :friendships

# set validations 
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :password

  def increment_win
    # increment win 
    self.games_won += 1 
    increment_games_played
  end 

  def increment_loss
    # increment loss 
    self.games_lost += 1
    increment_games_played
  end

  def increment_games_played
    self.games_played += 1
  end 

end
