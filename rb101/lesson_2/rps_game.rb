score = { win: 0, draw: 0, lose: 0 }

loop do
  puts "choose: 1. rock, 2. paper, 3. scissors"
  choice = ''

  loop do
    choice = gets.chomp.to_i

    if (1..3).include? choice
      break
    else
      puts "enter 1 for rock, 2 for paper, or 3 for scissors"
    end
  end

  ai = rand 1..3

  if choice == 1
    puts "you chose rock..."
    if ai == 1
      score[:draw] += 1
      puts "...opponent chooses rock, it's a DRAW"
    elsif ai == 2
      score[:lose] += 1
      puts "...opponent chooses paper, you LOSE"
    else
      score[:win] += 1
      puts "...opponent chooses scissors, you WIN"
    end
  elsif choice == 2
    puts "you chose paper..."
    if ai == 1
      score[:win] += 1
      puts "...opponent chooses rock, you WIN"
    elsif ai == 2
      score[:draw] += 1
      puts "...opponent chooses paper, it's a DRAW"
    else
      score[:lose] += 1
      puts "...opponent chooses scissors, you LOSE"
    end
  else
    puts "you chose scissors..."
    if ai == 1
      score[:lose] += 1
      puts "...opponent chooses rock, you LOSE"
    elsif ai == 2
      score[:win] += 1
      puts "...opponent chooses paper, you WIN"
    else
      score[:draw] += 1
      puts "...opponent chooses scissors, it's a DRAW"
    end
  end

  puts "WINS: #{score[:win]}, LOSES: #{score[:lose]}, DRAWS: #{score[:draw]}"

  puts "enter y to play again or any other key to exit"
  play_again = gets.chomp
  break unless play_again.downcase == "y"
end
