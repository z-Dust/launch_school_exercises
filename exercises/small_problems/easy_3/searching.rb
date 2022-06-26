arr = Array.new 5

arr.each_with_index do |n,i|
  puts "enter number #{i+1}:"
  arr[i] = gets.chomp.to_i
end

puts 'enter the last number'
search = gets.chomp.to_i

if arr.include? search
  puts "the number #{search} appears in #{arr}."
else
  puts "the number #{search} does not appear in #{arr}."
end
