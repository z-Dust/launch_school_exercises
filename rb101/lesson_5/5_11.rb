arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

a = arr.map do |sub_arr|
  sub_arr.select {|element| element % 3 == 0}
end

# a = arr.map do |element|
#   element.select do |num|
#     num % 3 == 0
#   end
# end
# => [[], [3], [9], [15]]
p a
