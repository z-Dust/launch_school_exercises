def fibonacci(num)
  first = 1
  second = 1
  count = 2
  next_num = 0

  loop do
    next_num = first + second
    first = second
    second = next_num
    count += 1
    break if count == num
  end

  next_num
end

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

def fibonacci_last(num)
  fibonacci(num).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4
