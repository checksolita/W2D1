require_relative 'piece.rb'
class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8){Array.new(8)}
    @rows[0] = @rows.map { |el| el = Piece.new }
    @rows[1] = @rows.map { |el| el = Piece.new }
    @rows[-2] = @rows.map { |el| el = Piece.new }
    @rows[-1] = @rows.map { |el| el = Piece.new }
  end

  def move_piece(start_pos, end_pos)
    x_start, y_start = start_pos
    x_end, y_end = end_pos
    if self[x_start][y_start].nil?
      raise ArgumentError.new "Position has no piece."
    elsif !self[x_end][y_end].nil?
      raise ArgumentError.new "There's a piece here already!"
    else 
      self[x_start][y_start], self[x_end][y_end] = self[x_end][y_end], self[x_start][y_start]
    end
  end

  def [](pos)
    self.rows[pos]
  end

    def valid_pos?(pos)
      pos = 
    end

end


  