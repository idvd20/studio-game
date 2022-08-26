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

    def play(rounds)
        puts "There are #{@players.size} players in #{@title}: "

        @players.each do |player|
            puts player
        end

        1.upto(rounds) do |rounds|
            puts "\nRound #{rounds}:"
            @players.each do |player|
                GameTurn.take_turn(player)
                puts player
              end
        end
    end

    def print_name_and_health(players)        
        players.each do |player|
            puts "#{player.name} (#{player.health})"
        end
    end

    def print_stats
        strong_players, wimpy_players = @players.partition { |player| player.strong? }

        puts "\n#{@title} Statistics\n"

        puts "\n#{strong_players.size} strong player/s:"
        print_name_and_health(strong_players)
        puts "\n#{wimpy_players.size} wimpy player/s:"
        print_name_and_health(wimpy_players)

        puts "\n#{@title} High Scores:"
        @players.sort.each do |player|
            formatted_name = player.name.ljust(20, ".")
            puts "#{formatted_name}  #{player.score}"
        end
    end
end