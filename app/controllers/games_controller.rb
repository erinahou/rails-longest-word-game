require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = alphabet.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read

    word = JSON.parse(word_serialized)

    @message_validWord = "Congratulations! #{params[:word]} is a valid English word!"

    if word[:found]
      @final_message = @message_validWord
    end
  end
end
