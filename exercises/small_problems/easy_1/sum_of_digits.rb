def sum(num)
  num_arr = num.to_s.split('')
  num_arr.map! { |n| n.to_i }
  num_arr.reduce(:+)
end

puts sum 234
