player1 = 'larry'
player2 = 'curly'
player3 = 'moe'
player4 = 'shemp'
health1 = 60
health2 = 125
health3 = 100
health4 = 90

puts "#{player1.capitalize}'s health is #{health1}"
puts "#{player2.upcase}'s health is #{health2}"

# health2 = health1
# puts "#{player2.upcase}'s health is #{health2}"

# health1 = 30
# puts "#{player1.capitalize}'s health is #{health1}"
# puts "#{player2.upcase}'s health is #{health2}"

puts "#{player3.capitalize}'s health is #{health3}".center(50, '*')

puts "#{player4.capitalize.ljust(30, '.')} #{health4} health"

time = Time.new.strftime("%A %m/%d/%Y at %I:%M%p")

puts "The game started on #{time}"

# puts "Players: \n\t#{player1} \n\t#{player2} \n\t#{player3}"