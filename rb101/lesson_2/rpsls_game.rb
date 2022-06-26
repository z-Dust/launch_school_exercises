VALID_CHOICES = %w(r p s l sp)

score = { win: 0, lose: 0, draw: 0, total: 0 }

def prompt(message)
  puts "=> #{message}"
end

def results(result)
  return "Draw!" if result == "draw"
  "You #{result}!"
end

def moves_matrix
  {
    r: { s: "win", l: "win", p: "lose", sp: "lose", r: "draw" },
    p: { r: "win", sp: "win", s: "lose", l: "lose", p: "draw" },
    s: { p: "win", l: "win", r: "lose", sp: "lose", s: "draw" },
    l: { p: "win", sp: "win", r: "lose", s: "lose", l: "draw" },
    sp: { s: "win", r: "win", p: "lose", l: "lose", sp: "draw" }
  }
end

def update_score(result, score)
  score[:total] += 1
  if result == "win"
    score[:win] += 1
  elsif result == "lose"
    score[:lose] += 1
  else
    score[:draw] += 1
  end
end

def grand_winner_control_and_display(score)
  if score[:win] >= 2
    prompt "You have won best two out of three. You are the winner!"
  elsif score[:lose] >= 2
    prompt "You have lost best two out of three. You are the loser!"
  else
    prompt "No winner yet of best two out of three, continue playing..."
  end
end

def scoreboard score
  "Wins: #{score[:win]}, Loses: #{score[:lose]}, Draw: #{score[:draw]}, Total Games: #{score[:total]}"
end

def input_to_word_list
  {
    r: "rock",
    p: "paper",
    s: "scissors",
    l: "lizard",
    sp: "spock"
  }
end

def input_to_word word
  word
end

prompt "Best two out of three: Rock, Paper, Scissors, Lizard, Spock!"

while score[:win] < 2 && score[:lose] < 2 do
  choice = ''
  loop do
    prompt "Enter your choice: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if VALID_CHOICES.include? choice
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  choice_display = input_to_word(input_to_word_list[choice.to_sym])
  computer_choice_display = input_to_word(input_to_word_list[computer_choice.to_sym])

  prompt "You chose: #{choice_display}; Computer chose: #{computer_choice_display}"


  prompt results moves_matrix[choice.to_sym][computer_choice.to_sym]

  update_score moves_matrix[choice.to_sym][computer_choice.to_sym], score
  prompt scoreboard score

  grand_winner_control_and_display score
end
