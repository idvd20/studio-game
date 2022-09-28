require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

module StudioGame    
    class Game
        attr_reader :title
    
        def initialize(title)
            @title = title.capitalize
            @players = []
        end
    
        def save_high_scores(to_file="high_scores.txt")
            File.open(to_file, "w") do |file|
                @players.sort.each do |player|
                   file.puts player.high_score_entry 
                end
            end
        end
    
        def load_players(from_file)
            # File.readlines(from_file).each do |line|
            #     add_player(Player.from_csv(line))            
            # end
    
            #Using CSV library
            CSV.foreach(from_file) do |row|
                player = StudioGame::Player.new(row[0], row[1].to_i)
                add_player(player)
            end
        end
    
        def add_player(player)
            @players << player
        end
    
        def play(rounds)        
            puts "\nThere are #{@players.size} players in #{@title}: "
            @players.each do |player|
                puts player
            end
    
            treasures = TreasureTrove::TREASURES
            puts "\nThere are #{treasures.size} treasures to be found:"
            treasures.each do |treasure|
                puts "A #{treasure.name} is worth #{treasure.points} points"
            end
    
            1.upto(rounds) do |rounds|
                if block_given?
                    break if yield                            
                end
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
                # formatted_name = player.name.ljust(20, ".")
                # puts "#{formatted_name}  #{player.score}"
                puts player.high_score_entry
            end
        
            @players.each do |player|
                puts "\n#{player.name}'s point totals:"
                player.each_found_treasure do |treasure|
                    puts "#{treasure.points} total #{treasure.name} points"
                end
                puts "#{player.points} grand total points"
            end
    
            puts "#{total_points} total points from treasures found"
        end
    
        def total_points
            @players.reduce(0) { |sum, player| sum + player.points}
        end
    end
end