class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  after_action :add_win_count,  only: [:update]
  after_action :add_lose_count, only: [:update]

  def new
    @game = Game.new
  end 


  def create
    if current_user
      @game = current_user.games.new(word: get_word(params[:difficulty]), guesses: "")
    else 
      @game = Game.new(word: get_word(params[:difficulty]), guesses: "")
    end 
    redirect_to game_path(@game) if @game.save
    # raise error -- maybe show 404 page
  end 


  def edit 
  end 


  def update
    check_letter(params[:letter])
    respond_to do |format|
      format.js { render 'show' } 
      format.html {render 'show' }  
    end 
  end 

  # destroy - this method will be called through the 'quit button'
  def destroy
    @game.destroy
    redirect_to root_path
  end 

private

  def set_game 
    @game = Game.find(params[:id])
  end 

  def check_letter(letter)
    if @game.word.include?(letter) # game.include_letter? (create method in game class) 
      @game.word.split("").each_with_index do |item, index| #game.place (convert this into a private method
        if item == letter
          @game.user_word[index] = letter 
        end 
      end 
    else
      @game.append_guess(letter)
      @game.remaining_guesses -= 1 # convert to method 
    end 
    @game.save
  end 

  # def check_word(word, game)
  #   if game.word == word 
  #     game.user_word = word 
  #   else
  #     game.append_guess(word) 
  #     game.remaining_guesses -= 1 
  #   end 
  #   game.save
  # end 

  def get_word(difficulty)
    url = "http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words?difficulty=#{difficulty}&minLength=b"
    @response = HTTParty.get(url).split(/\n/).shuffle.sample # change /n/ into constant call delimiter
    p @response
    return @response
    # if api call successful.... then do @response....
    # else raise error 
    # add comments about why you're doing each of these 
  end 

end