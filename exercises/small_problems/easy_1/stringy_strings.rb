def stringy(num)
  str = ''
  str << '10' * ( num / 2 )
  str << '1' if num % 2 == 1
  str
end

def stringy_alt(size, odd = 1)
  numbers = []
  even = 0
  if odd == 0 then even = 1 end

  size.times do |index|
    number = index.even? ? odd : even
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


puts stringy_alt(7, 0) == '1010101'
puts stringy_alt(7, 0) == '0101010'
