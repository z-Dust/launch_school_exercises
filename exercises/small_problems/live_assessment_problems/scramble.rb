# given two strings return true if a portion of the first string can be reaaranged to form the second string

# algorithm-
# convert first string to array
# iterate over chars of second string
#   if current char is present in array of first string, delete that char from the array
#       if ever false, return false
# return true at end

# def scramble(str1, str2)
#   str1_arr = str1.chars
#   str2.each_char do |char|
#     if str1_arr.include?(char)
#       str1_arr.delete_at(str1_arr.index(char))
#     else
#       return false
#     end
#   end
#   true
# end

def scramble(str1, str2)
  str2.each_char do |char|
    return false if str1.count(char) < str2.count(char)
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
