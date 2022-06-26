# def rotate_array(arr)
#   new_arr = arr.dup
#   new_arr.push(new_arr.shift)
#   new_arr
# end

def rotate_integer(num)
  str = num.to_s
  (str[1..-1] + str[0]).to_i
end

def rotate_string(str)
  str[1..-1] + str[0]
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string('zebra') == 'ebraz'

p rotate_integer(1234) == 2341
