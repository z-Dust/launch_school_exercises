def is_odd?(num)
  num % 2 == 1
end

def is_odd_again?(num)
  num.abs % 2 == 1
end

def is_odd_remainder?(num)
  num.abs.remainder(2) == 1
end

puts is_odd_remainder? 2
