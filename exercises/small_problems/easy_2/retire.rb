puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

years_to_go = retire_age - age

puts "It's #{Time.now.year}. You will retire in #{Time.now.year + (years_to_go)}."
puts "You have only #{years_to_go} years to go!"
