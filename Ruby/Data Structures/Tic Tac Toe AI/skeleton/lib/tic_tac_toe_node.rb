require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

    def initialize(board, next_mover_mark, prev_move_pos = nil)
      @board = board
      @next_mover_mark = next_mover_mark
      @prev_move_pos = prev_move_pos
    end

    def losing_node?(evaluator)
      return @board.won? && @board.winner != evaluator if @board.over?
      if @next_mover_mark == evaluator
        self.children.all? { |node| node.losing_node?(evaluator)}
      else
        self.children.any? { |node| node.losing_node?(evaluator)}
      end
    end

    def winning_node?(evaluator)
      return @board.winner == evaluator if @board.over?
      if @next_mover_mark == evaluator
        self.children.any? { |node| node.winning_node?(evaluator)}
      else
        self.children.all? { |node| node.winning_node?(evaluator)}
      end
    end

    # This method generates an array of all moves that can be made after
    # the current move.
    def children
      children = []

    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        pos = [row_idx, col_idx]

        # Can't move here if it's not free
        next unless board.empty?(pos)

        new_board = board.dup
        new_board[pos] = self.next_mover_mark
        next_mover_mark = (self.next_mover_mark == :x ? :o : :x)

        children << TicTacToeNode.new(new_board, next_mover_mark, pos)
      end
    end

    children
    end
end
