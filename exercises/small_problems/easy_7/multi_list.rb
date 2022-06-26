# def multiply_list(arr1, arr2)
#   i = 0
#   new_arr = []
#   loop do
#     new_arr << arr1[i] * arr2[i]
#     i += 1
#     break if i == arr1.size
#   end
#   p new_arr
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |n| n.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
