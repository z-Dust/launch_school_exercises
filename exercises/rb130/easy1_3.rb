def missing(arr)
  new_arr = []
  (arr[0]...arr[-1]).each {|x| new_arr << x if !arr.include?(x)}
  new_arr
end

# def missing(arr)
#   (arr.first..arr.last).to_a - arr
# end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
