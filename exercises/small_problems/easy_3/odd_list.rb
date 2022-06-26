# def oddities(arr)
#   new_arr = []
#   arr.each_index { |i| new_arr << arr[i] if i.even? }
#   new_arr
# end

# def oddities(arr)
#   new_arr = []
#   counter = 0
#   while counter < arr.size
#     new_arr << arr[counter]
#     counter += 2
#   end
#   new_arr
# end

def oddities(arr)
  arr.select { |e| arr.index(e).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
