def rotate_string(str)
  str[1..-1] + str[0]
end

def rotate_rightmost_digits(int, amount)
  str = int.to_s
  if amount < str.size
    new_str = str[0..str.size - 1 - amount]
    rotate_str = str.slice(str.size - amount, amount)
    final_str = ''
    final_str << new_str << rotate_string(rotate_str)
  else
    final_str = rotate_string(str)
  end
  final_str.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
