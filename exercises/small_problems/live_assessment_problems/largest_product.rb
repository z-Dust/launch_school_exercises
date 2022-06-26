=begin
  -convert number to string array of characters
  #-loop, determine product of each set of 5 consecutive digits, store value if higher than last
  -loop, capture all 5-length sub arrays into another array
  -iterate through array of subarrays, return the highest product
=end

def greatest_product(num)
  str = num.to_s
  arr = []
  (str.size - 4).times do |i|
    arr << str.slice(i, 5).chars.map {|char| char.to_i }.reduce(:*)
  end
  arr.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
