require_relative 'player'
require_relative 'game_turn'

class Game
    attr_reader :title

    def initialize(title)
        @title = title.capitalize
        @players = []
    end

    def add_player(player)
        @players << player
    end

    def play
        puts "There are #{@players.size} in #{@title}:"
        @players.each do |player|
            puts player
        end
        
        @players.each do |player|
            GameTurn.take_turn(player)
            puts player
          end
    end
end