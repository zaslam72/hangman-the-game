class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :bandaid]
  after_action :add_win_count, only: [:update]
  after_action :add_lose_count, only: [:update]

# get method that initializes new game
  def new
    @game = Game.new
  end

# post method for creation of game
# this method will check to see if there's a current user and create a game with the user association
# if no current user, then it will create a game without user association
# redirects to game show if the game saves
  def create
    if current_user
      @game = current_user.games.new(word: get_word(params[:difficulty]), guesses: "", difficulty: params[:difficulty])
    else
      @game = Game.new(word: get_word(params[:difficulty]), guesses: "", difficulty: params[:difficulty])
    end
    # redirect_to game_path(@game) if @game.save
    if @game.save
      redirect_to game_path(@game)
    else
      redirect_to '/404'
      # not_found
    end
  end

# post method for update of game
# this method will update the game with each guess of a letter
# it takes in a letter through params and calls the check_letter method below
  def update
    check_letter(params[:letter])
    respond_to do |format|
      format.js { render 'show' }
      format.html {render 'show' }
    end
  end

# delete method for deletion of game
# this method will delete a game
# it's called when a player decides to quit the game mid way
# user is then redirected to the home page
  def destroy
    @game.destroy
    redirect_to root_path
  end

# this method will restore a lifeline for the user if clicked
# decreases bandaid count by one and increases guesses count by one
  def bandaid
    @user = current_user
    @user.decrement_bandaid
    @user.save(validate: false)
    @game.increment_remaining_guess
    @game.save(validate: false)
    redirect_to game_path(@game)
  end 

private

# this method is called in the before_action for any action that has a game object
# it's duty is to store the object in an instance variable
# I included it here to make my code DRY
  def set_game
    @game = Game.find(params[:id])
  end

# this method is called in the update action
# it takes in a letter through params and checks the letter against the word
# if it's included:
  # it will split the string into an array of letters
  # check each index to see if the letter matches
  # if the letter matches, it will place the letter in the respective index in a generated string(user_word)
# if it's not included:
  # it will add the letter to a guesses string and
  # decrement the remaining_guesses count
  def check_letter(letter)
    if @game.include_letter?(letter) # game.include_letter? (create method in game class)
      @game.place(letter)
    else
      @game.append_guess(letter)
      @game.decrement_remaining_guess
    end
    @game.save(validate: false)
  end

# this method is my API call to the words list
# this method is called upon creation of a new game
# the url contains two parameters: difficulty + wordLength
# it uses HTTParty to get the response (which is an array of objects)
# I shuffle the array because the list is in alphabetical order (to increase probability of randomness)
# I then randomly select one word from this array and return it as my response
# I extract the word from the object and return it
  def get_word(difficulty)
    url = "https://hangmanwords.herokuapp.com/api/words?difficulty=#{difficulty}&wordLength=10"
    @response = HTTParty.get(url).shuffle.sample
    return @response['word']
  end

end