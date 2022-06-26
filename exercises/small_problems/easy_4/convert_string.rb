# def string_to_integer(str)
#   num, final = 0, 0
#   factor = 1
#   str.size.times do |index|
#     num = case str.reverse[index]
#           when '0' then 0
#           when '1' then 1
#           when '2' then 2
#           when '3' then 3
#           when '4' then 4
#           when '5' then 5
#           when '6' then 6
#           when '7' then 7
#           when '8' then 8
#           when '9' then 9
#           end

#     num *= factor
#     final += num
#     factor *= 10
#   end
#   final
# end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  num = 0
  str.size.times { |i| num = (10 * num) + DIGITS[str[i]] }
  num
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
