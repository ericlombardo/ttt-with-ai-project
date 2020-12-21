

class Board
  attr_accessor :cells

  def reset!
    @cells = starting_cells
  end
  
  def initialize
    @cells = starting_cells
    # binding.pry
  end

  def display # prints board out including cells array
    puts " #{@cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)  #=> what is in cell
    @cells[user_input.to_i - 1]
  end

  def full? #=> true for full board : false
      @cells.none?(" ")
  end

  def turn_count  #=> count of moves so far
      @cells.count {|c| c == "X" || c == "O"}
  end
  
  def taken?(position)  #=> true if position is taken
    cell = input_to_index(position) # converts input to 0 index
    @cells[cell] != " " # checks if spot is "X" or "O"
  end

  def starting_cells  # creates empty array
    Array.new(9, " ")
  end

  def input_to_index(input)
    input.to_i - 1
  end
end