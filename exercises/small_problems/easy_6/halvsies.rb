def halvsies(arr)
  new_arr = [[], []]
  arr.each_with_index do |ele, i|
    if arr.size.even?
      new_arr[0] << ele if i < (arr.size/2)
      new_arr[1] << ele if i >= (arr.size/2)
    else
      new_arr[0] << ele if i <= (arr.size/2)
      new_arr[1] << ele if i > (arr.size/2)
    end
  end
  new_arr
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
