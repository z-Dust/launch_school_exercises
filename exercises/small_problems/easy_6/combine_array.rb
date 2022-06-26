def merge(arr_1, arr_2)
  new_arr = []
  arr_1.each do |ele|
    new_arr << ele unless new_arr.include?(ele)
  end
  arr_2.each do |ele|
    new_arr << ele unless new_arr.include?(ele)
  end
  new_arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
