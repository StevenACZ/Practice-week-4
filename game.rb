require_relative "player"
require_relative "battle"

puts "Cual es tu nickname"
# nickname = gets.chomp
nickname = "Oli23Gamer"
puts "Con que tipo de personaje quieres iniciar?"
puts "1. Warrior 2. Magician"
# type = gets.chomp
type = "warrior"
puts "Dale un nombre a tu personaje"
# name = gets.chomp
name = "Steven"
player = Player.new(nickname, type, name)
bot = Bot.new("magician", "Gandaf")
battle = Battle.new(player, bot)
puts "#{player.name} reta a #{bot.name}"
battle.start