require_relative '../config/environment.rb'

class StartLogic
  
  def enter_players
    puts "Welcome to Tic Tac Toe"     # greats user and asks for player number
    puts "Players (0, 1, 2, exit)"
    players = gets.strip      # gets input and assigns it to variable
    system("clear")   # clears screen
    enter_players unless players == "0" || players == "1" || players == "2" || players == "exit"  # asks for input until it is 0, 1, or 2
    start_game(players)  # passes to #start_gmae method
  end

  def start_game(players)
    case players  # takes in players
    when '2'  # 2 humans
      token = which_token?  # finds out what tokens they want to use
      Game.new(human(token), human(token == "X" ? "O" : "X")).play  # creates and starts game
    when '1'  # 1 human and 1 computer
      first_move = go_first?  # checks if human wants to go first
      token = which_token?  # checks what token the human wants
      first_move == "yes" ?   # creates a game using above input
      Game.new(human(token), computer(token == "X" ? "O" : "X")).play : 
      Game.new(computer(token == "X" ? "O" : "X"), human(token)).play
    when '0'  # 2 computers
      Game.new(computer("X"), computer("O")).play   # creates the game for computers and starts game
    when 'exit'
      exit
    end
  end 
  
  def go_first? # asks if player wants to go first
    puts "Do you wish to have the first move? (yes or no)"  # prompt
    player_1 = gets.strip.downcase  # assign downcase input to variable
    exit if player_1 == "exit"  # checks for exit input
    system("clear")   # clear screen
    player_1 == "yes" || player_1 == "no" ? player_1 : go_first?  # prompts until input == "yes" or "no"
  end
  
  def which_token?  # asks what token player wants to use
    puts "Awesome! Player 1, would you like to be X or O?"  # prompt
    token = gets.strip.upcase # assigns upcase input to token variable
    exit if token == "EXIT" # checks for exit input
    system("clear") # clears screen
    token == "X" || token == "O" ? token : which_token?   # prompts until token == "X" or "O"
  end
  
  def human(token)  # creates a new human instance with token passed in
    Players::Human.new(token)
  end
  
  def computer(token) # creates a new computer instance with token passed in
    Players::Computer.new(token)
  end
end


# when 'war games'            NOT FUNCTIONAL, JUST IDEAS RIGHT NOW
#   # binding.pry
#   10.times do
#     Game.new(computer("X"), computer("O")).game_over
#   end
#   puts "#{Game.wins} total wins and #{Game.cats_games} total cat's games"




