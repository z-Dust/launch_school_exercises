

# def rotate_rightmost_digits(int, amount)
#   str = int.to_s
#   if amount < str.size
#     new_str = str[0..str.size - 1 - amount]
#     rotate_str = str.slice(str.size - amount, amount)
#     final_str = ''
#     final_str << new_str << rotate_string(rotate_str)
#   else
#     final_str = rotate_string(str)
#   end
#   final_str.to_i
# end

# def rotate_string(str, index_counter)
#   str[1..-1] + str[0]

# end

# def max_rotation(int)
#   str = int.to_s
#   str[1..-1] + str[0]
#   str = str[0] + str[2..-1] + str[1]
#   str = str[0..1] + str[3..-1] + str[2]
#   str = str[0..2] + str[4..-1] + str[3]
#   str = str[0..3] + str[4..-1] + str[4]


#   index_counter = 1
#   loop do
#     puts "wtf"
#     str = rotate_string(str, index_counter)
#     index_counter += 1
#     break if index_counter == str.size
#   end
#   str.to_i
# end

def max_rotation(num)
  str = num.to_s
  new_str = str.chars
  str.each_char.with_index do |_, i|
    new_str.push(new_str.delete_at(i))
  end
  new_str.join.to_i
end




p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
