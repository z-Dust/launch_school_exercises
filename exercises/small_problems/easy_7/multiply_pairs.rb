def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each {|n| arr2.each {|m| new_arr << n * m}}
  p new_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
