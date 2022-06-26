DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  num = 0
  str.size.times { |i| num = (10 * num) + DIGITS[str[i]] }
  num
end

# def string_to_signed_integer(str)
#   if str[0] == '-'
#     return string_to_integer(str[1..-1]) * -1
#   elsif str[0] == '+'
#     return string_to_integer(str[1..-1])
#   else
#     string_to_integer(str)
#   end
# end

def string_to_signed_integer(str)
  case str[0]
  when '-' then return string_to_integer(str[1..-1]) * -1
  when '+' then return string_to_integer(str[1..-1])
  else string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
