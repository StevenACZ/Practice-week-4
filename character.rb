require_relative "catalog"

class Character
  include Catalog

  attr_accessor :current_move
  attr_reader :type, :base_exp, :base_stats, :moves

  def initialize(type, name, level = 1)
    character_type = CHARACTER_TYPES[type]
    @type = type
    @current_move = nil
    @base_exp = character_type[:base_exp]
    @base_stats = character_type[:base_stats]
    @moves = character_type[:moves]
    @life = @base_stats[:hp]
  end

  def prepare_for_battle
    @life = @base_stats[:hp]
    @current_move = nil
  end

  def fainted?
    !@life.positive?
  end

  def attack(character)
    damage = MOVES[@current_move][:power]
    puts "#{@type} used #{@current_move}"
    character.receive_damage(damage)
    puts "Hits #{character.type} and caused #{damage}"
  end

  def receive_damage(damage)
    @life -= damage
  end

  def win(loser)
    # @base_exp +=
  end
end