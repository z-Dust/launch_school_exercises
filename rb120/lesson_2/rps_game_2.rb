=begin
class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  # def initialize(value)
  #   @value = value
  # end

  # def rock?
  #   @value == 'rock'
  # end

  # def paper?
  #   @value == 'paper'
  # end

  # def scissors?
  #   @value == 'scissors'
  # end

  # def spock?
  #   @value == 'spock'
  # end

  # def lizard?
  #   @value == 'lizard'
  # end

  def move?
    self.class
  end

  # def >(other_move)
  #   (rock? && (other_move.scissors? || other_move.lizard?)) ||
  #     (paper? && (other_move.rock? || other_move.spock?)) ||
  #     (scissors? && (other_move.paper? || other_move.lizard?)) ||
  #     (spock? && (other_move.scissors? || other_move.rock?)) ||
  #     (lizard? && (other_move.paper? || other_move.spock?))
  # end

  # def <(other_move)
  #   (rock? && (other_move.paper? || other_move.spock?)) ||
  #     (paper? && (other_move.scissors? || other_move.lizard?)) ||
  #     (scissors? && (other_move.rock? || other_move.spock?)) ||
  #     (spock? && (other_move.paper? || other_move.lizard?)) ||
  #     (lizard? && (other_move.scissors? || other_move.rock?))
  # end


end

class Rock < Move
   attr_reader :name

  def initialize
    @name = 'rock'
  end

  def >(other_move)
    (other_move.name == 'scissors') || (other_move.name == 'lizard')
  end

  def <(other_move)
    (other_move.name == 'paper') || (other_move.name == 'spock')
  end
end

class Paper < Move
  attr_reader :name

  def initialize
    @name = 'paper'
  end

  def >(other_move)
    (other_move.name == 'rock') || (other_move.name == 'spock')
  end

  def <(other_move)
    (other_move.name == 'scissors') || (other_move.name == 'lizard')
  end
end

class Scissors < Move
  attr_reader :name

  def initialize
    @name = 'scissors'
  end

  def >(other_move)
    (other_move.name == 'paper') || (other_move.name == 'lizard')
  end

  def <(other_move)
    (other_move.name == 'rock') || (other_move.name == 'spock')
  end
end

class Spock < Move
  attr_reader :name

  def initialize
    @name = 'spock'
  end

  def >(other_move)
    (other_move.name == 'scissors') || (other_move.name 'rock')
  end

  def <(other_move)
    (other_move.name == 'paper') || (other_move.name 'lizard')
  end

  # def to_s
  #     @value.capitalize
  # end
end

class Lizard < Move
  attr_reader :name

  def initialize
    @name = 'lizard'
  end

  def >(other_move)
    (other_move.name == 'paper') || (other_move.name 'spock')
  end

  def <(other_move)
    (other_move.name == 'scissors') || (other_move.name 'rock')
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def score_point
    @score += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end

    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, Spock, or lizard:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Object.const_get(choice.capitalize)
    p self.move.class
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    # self.move = Move.new(Move::VALUES.sample)
    self.move = Object.const_get(Move::VALUES.sample.capitalize)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hi #{human.name}!"
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_score
    puts "#{human.name}: #{human.score} - #{computer.name}: #{computer.score}"
  end

  def determine_winner
    if human.score > 9
      puts "#{human.name} is the grand winner!"
      true
    elsif computer.score > 9
      puts "#{computer.name} is the grand winner!"
      true
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score_point
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.score_point
    else
      # p human.move
      # p computer.move
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or no."
    end

    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
        break if determine_winner
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end
RPSGame.new.play
=end

module Describable
  SIDES = nil
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
  def sides; SIDES; end
end

class Square < Quadrilateral

end

p Square.sides # => 4
p Square.new.sides # => 4
p Square.new.describe_shape # => "I am a Square and have 4 sides."
