target = ''
loop do
  puts 'input a natural number target'
  target = gets.chomp
  if target.to_i > 0
    break
  else
    puts 'invalid input'
  end
end

target = target.to_i

choice = 'y'
factors = []
while choice.downcase == 'y'
  factor = ''
  loop do
    puts 'enter a factor'
    factor = gets.chomp
    if factor.to_i > 0
      break
    else
      puts 'invalid input'
    end
  end
  factors << factor.to_i

  puts 'do you want to enter another factor? enter y to continue or any key to stop'
  choice = gets.chomp
end

multiples = []
current_num = 1
while current_num <= target.to_i
  factors.each do |num|
    multiples << current_num if current_num % num == 0
  end
    current_num += 1
end

sum = 0

multiples.each { |num| sum += num }

puts "the sum of all multiples is #{sum}"
