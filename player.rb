require_relative "character"

class Player
  attr_reader :name, :character
  def initialize(nickname, type, name)
    @name = nickname
    @character = Character.new(type, name)
    p @character
  end

  def select_move
    puts "Your moves: #{@character.moves}"
    move = gets.chomp
    @character.current_move = move
  end
end

class Bot < Player
  def initialize(type, name)
    super("Botcito", type, name)
  end

  def select_move
    move = @character.moves.sample
    @character.current_move = move
  end
end