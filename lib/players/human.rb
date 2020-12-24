require_relative '../../config/environment.rb'

module Players  # create players modue to follow file structure
  class Human < Player  # create Human class and inherit Player class
    def move(board) # define move, take in board argument
      puts "'exit' at any time to quit"
      puts "Please enter a number between 1-9:"
      user_input = gets.strip # collects user for input
    end
  end

end