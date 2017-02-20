class Game < ApplicationRecord
# set associations
  belongs_to :user, optional: true 
  before_create :initialize_user_word

# set validations 
  validates_presence_of :word

# method to set condition for win
# returns true or false
  def win
    self.user_word == self.word
  end 

# method to set condition for loss
# returns true or false 
  def lose
    self.remaining_guesses == 0
  end 

# adds guess into incorrect guesses string 
# returns updated string 
# called by check_letter method in games_controller
  def append_guess(guess)
    self.guesses += guess 
  end 

# checks to see if the guess is included in the word
# returns true or false 
# called by check_letter method in games_controller
  def include_letter?(guess) 
    self.word.include?(guess)
  end 

# places the guess in the correct index location as the word 
# called by check_letter method in games_controller 
  def place(guess)
    self.word.split("").each_with_index do |item, index|
      if item == guess 
        self.user_word[index] = guess 
      end 
    end 
  end 

# decreases the remaining_guesses count by one
# called by check_letter method in games_controller 
  def decrement_remaining_guess
    self.remaining_guesses -= 1 
  end 

# increases the remaining_guesses count by one
# called by bandaid action in games_controller 
  def increment_remaining_guess
    self.remaining_guesses += 1
  end 

 private

# this is a private method that is called before a game object is created (see before_create above)
# this creates a string of underscores with the same length as the word
  def initialize_user_word
    self.user_word = "_" * self.word.length
  end 

end 