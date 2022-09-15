require_relative 'game'
require_relative 'player'

# player1 = Player.new("moe")
# player2 = Player.new("larry", 60)
# player3 = Player.new("curly", 125)
# player4 = Player.new("shemp", 90)

knuckleheads = Game.new("knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
# knuckleheads.play(10) do
#     knuckleheads.total_points >= 2000
# end

loop do
    puts "\nHow many game rounds? ('quit' to exit)"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        knuckleheads.play(answer.to_i) do
            knuckleheads.total_points >= 2000
        end
    when 'quit', 'exit'
        knuckleheads.print_stats
        break
    else
        puts "Please enter a number or 'quit'"
    end
end

knuckleheads.save_high_scores