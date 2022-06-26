require 'pry'


# module Ai
  # WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7] +
  #   [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
=begin
  class Threat
    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7] +
      [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    attr_accessor :marker, :square

    def initialize(marker, square)
      @marker = marker
      @square = square
    end

    def ai_defense
      WINNING_LINES.each do |line|
        squares = @squares.select {|k,_| line.include?(k)}
        next if squares.values.count(' ') != 1
        if two_marker_threat?(squares)
          # return Threat.new(squares.select(&:marked?).collect(&:marker).first.marker, squares.key(' '))
          return squares.select(&:marked?).collect(&:marker).first.marker
        end
      end
      nil
    end

    def ai_defense_attack
      WINNING_LINES.each do |line|
        squares = @squares.select {|k,_| line.include?(k)}
        next if squares.values.count(' ') != 1
        if two_marker_threat?(squares)
          # return Threat.new(squares.select(&:marked?).collect(&:marker).first.marker, squares.key(' '))
          # return squares.select(&:marked?).collect(&:marker).first.marker
          squares.key(' ')
        end
      end
      nil
    end

    def two_marker_threat?(squares)
      squares.keys.select(&:marked?).collect(&:marker).uniq.count == 1
    end
  end
  # end


# module Ai
#   WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7] +
#     [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

#   class Threat
#     attr_reader :marker, :square

#     def initialize(marker, square)
#       @marker = marker
#       @square = square
#     end
#   end

#   def ai_defense
#     WINNING_LINES.each do |line|
#       # squares = @squares.values_at(*line)
#       squares = @squares.select {|k,_| line.include?(k)}
#       next if squares.values.count(' ') != 1
#       # values_at(*line)
#       # keys = @squares.keys
#       if two_marker_threat?(squares)
#         # binding.pry
#         # sqr = squares.delete_if {|_,v| v == ' '}
#         # squares.
#         return Threat.new(squares.select(&:marked?).collect(&:marker).first.marker, squares.key(' '))
#       end
#     end
#     nil
#   end

#   def two_marker_threat?(squares)
#     squares.keys.select(&:marked?).collect(&:marker).uniq.count == 1
#     # unmarked = squares.select(&:unmarked?)
#     # return false if marked.size != 2 || unmarked != 1
#     # marked[0] == marked[1]
#   end

#   # def defend
#   #   # squares.select(&:unmarked?).k
#   #   squares.key(' ')
#   # end
# end
=end


class Board
  # include Ai

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7]] +
    [[2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end


  def ai_defense
    WINNING_LINES.each do |line|
      # squares = @squares.select {|k,_| line.include?(k)}.values
      squares = @squares.values_at(*line)
      # p squares
      # p "#{line} line"
      # p "#{squares.keys} keys"

      # squares.values.select(&:marked?).collect(&:marker)

      # p squares.values.count(:unmarked?) != 1

      # next if squares.values.count(' ') != 1

      if two_marker_threat?(squares)
        # return Threat.new(squares.select(&:marked?).collect(&:marker).first.marker, squares.key(' '))
        # p squares.select(&:marked?).collect(&:marker).first
        p squares.first.marker
        return squares.first.marker
      end
    end
    nil
  end

  def ai_defense_attack
    WINNING_LINES.each do |line|
      squares = @squares.select {|k,_| line.include?(k)}
      # next if squares.values.count(' ') != 1
      if two_marker_threat?(squares)
        # return Threat.new(squares.select(&:marked?).collect(&:marker).first.marker, squares.key(' '))
        # return squares.select(&:marked?).collect(&:marker).first.marker
        squares.key(' ')
      end
    end
    nil
  end

  def two_marker_threat?(squares)
    # squares.select(&:marked?).collect(&:marker).uniq.count == 1
    p squares
    # p @squares
    markers = squares.select(&:marked?).collect(&:marker)
    # p markers.size != 2
    return false if markers.size != 2
    p markers
    p markers.uniq
    p markers.uniq.size == 1
  end


  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker?
  end

  def winning_marker?
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "#{' ' * 34}  #{@squares[1]} | #{@squares[2]} | #{@squares[3]}"
    puts "#{' ' * 34} -----------"
    puts "#{' ' * 34}  #{@squares[4]} | #{@squares[5]} | #{@squares[6]}"
    puts "#{' ' * 34} -----------"
    puts "#{' ' * 34}  #{@squares[7]} | #{@squares[8]} | #{@squares[9]}"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def to_s
    arr = unmarked_keys
    return arr.join if arr.size == 1
    last = arr.pop
    arr.join(', ').concat(" or #{last}")
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end





class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
    reset_score
  end

  def score
    @score
  end

  def score_point
    @score += 1
  end

  def reset_score
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  # Player = Struct.new(:marker, :score) do
  #   def initialize(*)
  #     super
  #     self.score = 0
  #   end

  #   def score_point
  #     self.score += 1
  #   end
  # end

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def player_move
    loop do
      # puts "true" if board.ai_defense == human.marker
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def update_score
    case board.winning_marker?
    when human.marker then human.score_point
    when computer.marker then computer.score_point
    end
  end

  def main_game
    loop do
      loop do
        display_board
        player_move
        update_score
        display_result
        break if grand_winner?
        game_reset
      end
      break unless play_again?
      game_reset
      reset_scores
      disply_play_again_message
    end
  end

  def grand_winner?
    human.score == 5 || computer.score == 5
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "First to five points wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    display_score
    puts "\n\n"
    board.draw
    puts "\n\n"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_moves
    puts "Choose an available square: #{board}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Must choose a valid square"
    end

    board[square] = human.marker
  end

  def computer_moves
    # threat = board.ai_defense
    # p threat.marker
    if board.ai_defense == human.marker
      return board[board.ai_defense_attack] = computer.marker
    end
    # square = board.square if board.ai_defense == human.marker
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_score
    puts "Score: Human (#{human.marker}) - #{human.score} | Computer (#{computer.marker}) - #{computer.score}"
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker?
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end

    display_score
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Must be y or n"
    end

    answer == 'y'
  end

  def game_reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def reset_scores
    human.reset_score
    computer.reset_score
  end

  def disply_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def clear
    # system 'clear'
  end
end

game = TTTGame.new
game.play
