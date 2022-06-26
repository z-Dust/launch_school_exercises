def sum_square_difference(num)
  sum_square = 0
  square_sum = 0

  1.upto(num) do |i|
    sum_square += i
    square_sum += i**2
  end

  sum_square**2 - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
