def zip(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |e, i|
    new_arr << [e, arr2[i]]
  end
  new_arr
end

# def zipper(array1, array2)
#   array1.each_with_index.with_object([]) do |(element, index), result|
#     result << [element, array2[index]]
#   end
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
