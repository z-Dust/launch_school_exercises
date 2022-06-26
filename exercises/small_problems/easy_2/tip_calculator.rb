puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip = (bill * (tip_percentage / 100)).round(2)
total = tip + bill

puts "The tip is $#{'%.2f' % tip}\nThe total is $#{'%.2f' % total}"
