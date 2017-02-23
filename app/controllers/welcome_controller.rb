class WelcomeController < ApplicationController

  def index
    get_all_words unless is_all_words_loaded? 
  end 

end