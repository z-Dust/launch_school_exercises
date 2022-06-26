def interleave(arr_1, arr_2)
  new_arr = []
  arr_1.size.times do |n|
    new_arr << arr_1[n] << arr_2[n]
  end
  new_arr
end

def interleave(arr_1, arr_2)
  arr_1.zip(arr_2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
