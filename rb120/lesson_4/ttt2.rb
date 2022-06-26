class Board
  WINNING_LINES = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  # WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  def initialize
    @squares = []
    reset
   end

  def unmarked_keys
    @squares.select(&:unmarked?).collect(&:position)
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

  def resetW
    (0..8).each { |index| @squares[index] = Square.new(index + 1) }
  end

  def draw
    puts "#{' '*34}  #{@squares[0]} | #{@squares[1]} | #{@squares[2]}"
    puts "#{' '*34} -----------"
    puts "#{' '*34}  #{@squares[3]} | #{@squares[4]} | #{@squares[5]}"
    puts "#{' '*34} -----------"
    puts "#{' '*34}  #{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
  end

  def []=(num, marker)
    @squares[num - 1].marker = marker
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

  attr_accessor :position, :marker

  def initialize(position, marker=INITIAL_MARKER)
    @position = position
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

  def position
    @position
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  Player = Struct.new(:marker)

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      game_reset
      disply_play_again_message
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts @human.class
    puts "You are #{human.marker}. Computer is #{computer.marker}"
    puts ''
    board.draw
    puts ''
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
    puts "Choose an available square: #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = (gets.chomp.to_i)
      break if board.unmarked_keys.include?(square)
      puts "Must choose a valid square"
    end

    board[square] = human.marker
  end

  def computer_moves
    board[(board.unmarked_keys.sample)] = computer.marker
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

  def disply_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def clear
    system 'clear'
  end
end

game = TTTGame.new
game.play
