# 1. Display the initiali empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

IMMEDIATE_THREAT = [[1, 2], [2, 3], [4, 5], [5, 6], [7, 8], [8, 9]] +
                   [[1, 4], [4, 7], [2, 5], [5, 8], [3, 6], [6, 9]] +
                   [[1, 5], [5, 9], [3, 5], [5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'x'
COMPUTER_MARKER = 'O'

def joinor(arr, delim=', ', word='or')
  conj = delim + word + ' '
  arr[0..-2].join(delim) + "#{conj if arr.size > 1}#{arr[-1]}"
end

def prompt(msg)
  puts "=> " + msg
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, p_score, c_score)
  system 'clear'
  puts 'First to score of 5 wins'
  puts "You're #{PLAYER_MARKER}: #{p_score}. Computer is #{COMPUTER_MARKER}: #{c_score}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

# def find_at_risk_square(line, board)
#   if board.values_at(*line).count(PLAYER_MARKER) == 2
#     board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
#   else
#     nil
#   end
# end

# def find_winning_square(line, board)
#   if board.values_at(*line).count(COMPUTER_MARKER) == 2
#     board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
#   else
#     nil
#   end
# end



def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_square(line, brd, COMPUTER_MARKER)
    # square = find_at_risk_square(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # if !square && brd[5] == INITIAL_MARKER
  #   square = 5
  # else
  #   square = empty_squares(brd).sample
  # end

  # if !square
  #   if brd[5] == INITIAL_MARKER
  #     square = 5
  #   end
  # end

  # if !square
  #   square = empty_squares(brd).sample
  # end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  elsif !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

# def computer_places_piece!(brd)
#   threat = false
#   WINNING_LINES.each do |line|
#     if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
#       brd.values_at(*line).count(INITIAL_MARKER) == 1

#       square = brd.slice(*line).key(INITIAL_MARKER)
#       brd[square] = COMPUTER_MARKER
#       threat = true
#       break
#     end
#   end

#   if threat == false
#     square = empty_squares(brd).sample
#     brd[square] = COMPUTER_MARKER
#     # threat = false
#   end
# end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# def keep_score(winner, p_score, c_score)
#   if winner == 'Player'
#     p_score += 1
#   elsif winner == 'Computer'
#     c_score += 1
#   end
# end

def display_grand_winner(p_score, c_score)
  if p_score > 4
    prompt 'Player is grand winner!'
  elsif c_score > 4
    prompt 'Computer is grand winner!'
  end
end

def who_goes_first
  prompt 'Who should go first? 1. Player, 2. Computer, 3. Random'
  choice = gets.chomp
  choice
end

def place_piece!(brd, cur_player)
  if cur_player == 'player'
    player_places_piece!(brd)
  elsif cur_player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(cur_player)
  cur_player == 'player' ? 'computer' : 'player'
end

loop do
  player_score, computer_score = 0, 0
  first_to_act = ''

  loop do
    board = initialize_board
    first_to_act = who_goes_first
    first_to_act = ['1', '2'].sample if first_to_act == '3'

    first_to_act == '1' ? current_player = 'player' : current_player = 'computer'

    loop do
      display_board(board, player_score, computer_score)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)


      # case first_to_act
      # when '1'
      #   player_places_piece!(board)
      #   break if someone_won?(board) || board_full?(board)

      #   computer_places_piece!(board)
      #   break if someone_won?(board) || board_full?(board)
      # when '2'
      #   computer_places_piece!(board)
      #   display_board(board, player_score, computer_score)
      #   break if someone_won?(board) || board_full?(board)

      #   player_places_piece!(board)
      #   break if someone_won?(board) || board_full?(board)
      # end
      # --------------------------
      # display_board(board, player_score, computer_score)

      # player_places_piece!(board)
      # break if someone_won?(board) || board_full?(board)

      # computer_places_piece!(board)
      # break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    if someone_won?(board)
      # keep_score(detect_winner(board), player_score, computer_score)
      winner = detect_winner(board)
      if winner == 'Player'
        player_score += 1
      elsif winner == 'Computer'
        computer_score += 1
      end

      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    break if player_score > 4 || computer_score > 4
  end

  prompt "Final score -- Player: #{player_score} - Computer: #{computer_score}"
  display_grand_winner(player_score, computer_score)

  prompt 'Do you want to play again? (y or n)'
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
