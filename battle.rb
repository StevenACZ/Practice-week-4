require_relative "catalog"

class Battle
  include Catalog

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @character1 = @player1.character
    @character2 = @player2.character
  end

  def start
    until @character1.fainted? || @character2.fainted?
      @player1.select_move
      @player2.select_move
      puts "#{@player1.name} eligio:"
      p @character1.current_move
      puts "#{@player2.name} eligio:"
      p @character2.current_move

       
      first = attack_order(@character1, @character2)
      second = first == @character1 ? @character2 : @character1

      first.attack(second)
      second.attack(first) unless second.fainted?
      next unless first.fainted?

      p first.life
      p second.life
    end

    @winner = @character1.fainted? ? @character2 : @character1
    puts "#{@winner.type} WINS!"
    @loser = @winner == @character1 ? @character2 : @character1
    @winner.win(@loser)
  end

  def attack_order(ch1, ch2)
    compare = MOVES[ch1.current_move][:priority] <=> MOVES[ch2.current_move][:priority]
    case compare
    when -1 then ch2
    when 1 then ch1
    when 0 then nil
    end
  end
end