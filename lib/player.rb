require_relative '../config/environment.rb'

class Player  # creates the genreal attributes that apply to all players in game
  attr_reader :token  # token can't be changed after initialization

  def initialize(token)
    @token = token  # takes in token and assigns to instance variable
  end
end

