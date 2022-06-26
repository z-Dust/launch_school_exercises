puts 'enter the first positive integer'
one = gets.chomp.to_i

puts 'enter the second positive integer'
two = gets.chomp.to_i

add = one + two
subtr = one - two
mul = one * two
div = one / two
rem = one % two
pow = one ** two

puts "#{one} + #{two} = #{add}"
puts "#{one} - #{two} = #{subtr}"
puts "#{one} * #{two} = #{mul}"
puts "#{one} / #{two} = #{div}"
puts "#{one} % #{two} = #{rem}"
puts "#{one} ** #{two} = #{pow}"
