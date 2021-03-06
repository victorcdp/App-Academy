require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n*n)/2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        return false if @remaining_misses > 0
        p 'you lose'
        true
    end

    def win?
        return false if @board.num_ships > 0
        p 'you win'
        true
    end

    def game_over?
        win? || lose?
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(move)
        @board.print
        p @remaining_misses
    end
end
