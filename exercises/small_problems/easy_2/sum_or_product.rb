puts "enter an integer greater than 0"
int = gets.chomp.to_i

puts "enter 's' to compute sum, 'p' to compute product"
compute = gets.chomp.downcase

# if compute == 's'
#   sum = 0
#   # int.times { |i| sum += (i + 1) }
#   1.upto(int) { |i| sum += i }
#   puts "the sum of all integers between 1 and #{int} is #{sum}"
# elsif compute == 'p'
#   product = 1
#   # int.times { |i| product *= (i + 1) }
#   1.upto(int) { |i| product *= i }
#   puts "the product of all integers between 1 and #{int} is #{product}"
# else
#   puts "unrecognized input"
# end

if compute == 's'
  sum = (1..int).inject { |sum, i| sum += i }
  puts "the sum of all integers between 1 and #{int} is #{sum}"
elsif compute == 'p'
  product = (1..int).inject { |product, i| product *= i }
  puts "the product of all integers between 1 and #{int} is #{product}"
else
  puts "unrecognized input"
end
