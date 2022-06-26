puts 'Please write word or multiple words:'
str = gets.chomp

puts "there are #{str.gsub(/\s+/, '').length} characters in '#{str}'"
