# def crunch(str)
#   new_str = ''
#   str.each_char { |char| new_str << char unless char == new_str.chars.last }
#   new_str
# end

def crunch(str)
  p str.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
