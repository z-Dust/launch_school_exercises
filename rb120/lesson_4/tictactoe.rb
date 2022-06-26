=begin
    -tic-tac-toe: players take turns placing their markers on a 3x3 grid. The player that places 3 of their markers in a row wins

    nouns: grid, x's, o's, 3-in-a-row, players
    verbs: place marker

    classes: grid, x/o < player, place_marker
=end

class Board
  attr_accessor :squares_hsh

  LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
     ready_board
  end

  def ready_board
    @squares_hsh = (1..9).each_with_object(' ').to_h
  end

  def display_grid
    puts ''
    puts "#{' '*30}  #{squares_hsh[1]} | #{squares_hsh[2]} | #{squares_hsh[3]}"
    puts "#{' '*30} -----------"
    puts "#{' '*30}  #{squares_hsh[4]} | #{squares_hsh[5]} | #{squares_hsh[6]}"
    puts "#{' '*30} -----------"
    puts "#{' '*30}  #{squares_hsh[7]} | #{squares_hsh[8]} | #{squares_hsh[9]}"
    puts ''
  end

  def place_marker(coordinate, marker)
    squares_hsh[coordinate] = marker
  end
end

class Game < Board
  attr_accessor :human, :computer

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
    puts "Choose X's or O's"
  end

  def choose_marker
    answer = ''
    loop do
      answer = gets.chomp.upcase
      break if answer == 'X' || answer == 'O'
      puts 'Must choose X or O'
    end
    @human = Player.new(answer)
    answer == 'X' ? @computer = Player.new('O') : @computer = Player.new('X')
  end

  def determine_available_squares
    squares_hsh.select {|_, value| value != human.marker && value != computer.marker }.keys
  end

  def play
    display_welcome_message
    choose_marker
    loop do
      loop do
        display_grid
        available_squares = determine_available_squares
        puts "Place an #{human.marker} on an unmarked square: #{available_squares}"
        choice = ''
        loop do
          choice = gets.chomp.to_i
          break if available_squares.include?(choice)
          puts "Must choose an available square"
        end
        place_marker(choice, human.marker)
        break if winner?(human.marker) || board_full?
        place_marker(squares_hsh.select {|_, value| value != human.marker && value != computer.marker }.keys.sample, computer.marker)
        break if winner?(computer.marker) || board_full?
      end
      display_grid
      if board_full?
        puts "No winner!"
      else
        display_winner
      end
      puts "Enter 'y' to play again or any other key to exit"
      answer = gets.chomp.downcase
      break unless answer == 'y'
      ready_board
    end
  end

  def display_winner
    winner = ''
    winner?(human.marker) ? winner = "You won!" : winner = "Computer won!"
    puts winner
  end

  def winner?(marker)
    LINES.each do |line|
      return true if squares_hsh.select { |square, _| line.include?(square) }.values.all? { |square| square == marker}
    end
    false
  end

  def board_full?
    squares_hsh.values.all? {|square| square != ' ' }
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

game = Game.new
game.play
