def ascii_value(str)
  num = 0
  str.size.times { |i| num += str[i].ord }
  num
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
