require_relative '../config/environment'

class Game  # main model for each instance of Tic-tac-toe session
  attr_accessor :board, :player_1, :player_2 
  
  @@wins = 0        # creates class variables to count total wins
  @@cats_games = 0  # and cats_games => utalized for war games 
  
  def self.wins  # #getter methods for class variables 
    @@wins
  end

  def self.cats_games
    @@cats_games
  end

  WIN_COMBINATIONS = [  # lists winning combinations to 
    [0,1,2],            # check for a win
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1  # creates a new game when initialized
    @player_2 = player_2  # with 2 human player instances by default
    @board = board        # and an empty board array
  end

  def current_player  #=> current player instance
    @board.turn_count.even? ? @player_1 : @player_2  
  end

  def won? # check for winning combo
    winner = WIN_COMBINATIONS.select do |combo|
      combo.all?{|index| @board.cells[index] == "X"} || combo.all?{|index| @board.cells[index] == "O"}
    end
    winner.empty? ? false : winner.flatten
  end

  def draw? #=> true for draw
    @board.turn_count == 9 && !won? # board full and no winner
  end

  def over? #=> true if draw or won
    draw? || won?
  end

  def winner #=> returns winner token using winning combo
    @board.cells[won?[0]] if won?
  end

  def turn  # executes a turn, makes move, asks for input,
    @board.display
    move = current_player.move(@board) # gets player_1 input and checks if valid move
    exit if move == "exit"
    @board.valid_move?(move) ? @board.update(move, current_player) && system("clear") : system("clear") && turn
  end

  def play
    turn while !over?  
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!") # congrats winner x or o
    @board.display
  end
end

  # def game_over          NOT FUNCTIONAL, JUST THOUGHTS I HAD
  #   while !over?
  #     @board.display
  #     move = current_player.war_games_logic(@board)
  #     @board.update(move, current_player)
  #     system("clear")
  #   end
  #   if won?
  #     @@wins += 1
  #   else
  #     @@cats_games += 1
  #   end
  # end

