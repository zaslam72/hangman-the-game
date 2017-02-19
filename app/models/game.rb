class Game < ApplicationRecord
# set associations
  belongs_to :user, optional: true 
  before_create :initialize_user_word

  # validate :validate_input

  # def validate_input
  #   #add regex code here 
  #   @errors = ['Character must be a letter only!']
  # end 


  def append_guess(guess)
    self.guesses += guess 
  end 
 
 private
  def initialize_user_word

    self.user_word = "_" * self.word.length # public method in game class (intialize_user_word(length))
  end 

end 