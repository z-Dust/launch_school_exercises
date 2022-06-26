def multiply(one, two)
  one * two
end

def square(n)
  multiply(n, n)
end

def power(base, exponent)
  multiply(base, 1) ** exponent
end

puts square(5) == 25
puts square(-8) == 64
