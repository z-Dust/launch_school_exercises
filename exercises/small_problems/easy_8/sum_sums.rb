def sum_of_sums(arr)
  sum = 0
  iterations = 1
  loop do
    iterations.times do |n|
      sum += arr[n]
    end
    iterations += 1
    break if iterations > arr.size
  end
  p sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
