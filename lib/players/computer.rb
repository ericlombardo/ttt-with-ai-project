require_relative '../../config/environment.rb'

module Players
  class Computer < Player

    
    def random_logic_move(board)
      spots = []  # creates empty array
      # loops through each cell, pushes available spots into array
      board.cells.each_with_index{|c, i| spots << (i + 1) if c == " "}  
      spots[rand(spots.count)].to_s  # returns a random spot that is available as a string
    end
    def move(board)
      sleep(1)
      random_logic_move(board)
    end
  end
end



# def war_games_logic(board)                  NOT FUNCTIONAL, JUST IDEAS RIGHT NOW
#   opponent = self.token = "X" ? "O" : "X"
#   if board.cells.uniq.count == 1
#     random_logic_move(board)
#   elsif Game::WIN_COMBINATIONS.any? {|combo| combo.include?(opponent)}
    
# end