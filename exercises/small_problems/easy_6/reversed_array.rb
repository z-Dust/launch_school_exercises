# def reverse_array(arr)
#   arr.each_index do |i|
#     arr[i], arr[-(i+1)] = arr[-(i+1)], arr[i]
#     break if (i) > (arr.size / 2) - 2
#   end
#   p arr
# end

# part 2
# def reverse_array(arr)
#   new_arr = []
#   arr.each_index do |i|
#     new_arr[i] = arr[-(i+1)]
#   end
#   p new_arr
# end

def reverse_array(arr)
  new_arr = arr.each_with_object([]) do |i, a|
    # a[i] = arr[-(i+1)]
    a.unshift(i)
  end
  p new_arr
end

an_arr = %w(a b c d e)
reverse_array(an_arr)
