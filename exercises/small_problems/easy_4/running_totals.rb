# def running_total(arr)
#   sum = 0
#   new_arr = []

#   arr.each do |n|
#     sum += n
#     new_arr << sum
#   end
#   new_arr
# end

# def running_total(arr)
#   sum = 0
#   arr.each_with_object([]) { |i, a| a << sum += i }
# end

# def running_total(arr)
#   arr.inject([]) { |arr, n| arr << arr.last.to_i + n }
# end

# def running_total(arr)
#   arr.map.with_index { |_, i| arr[0..i].reduce(&:+) }
# end

def running_total(arr)
  arr.each_with_object([]) { |value, arr| arr << (value + arr.last.to_i)}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
