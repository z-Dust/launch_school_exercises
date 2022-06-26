def average(arr)
  sum = 0
  arr.each { |num| sum += num }
  arr_average = sum / arr.size
end

def average_float(arr)
  sum = 0
  arr.each { |num| sum += num }
  arr_average = sum.to_f / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average_float([1, 6]) == 3.5
