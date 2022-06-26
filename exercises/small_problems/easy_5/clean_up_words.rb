# ALPHABET = ('a'..'z').to_a

# def cleanup(str)
#   new_arr = []
#   str.chars.each do |char|
#     if ALPHABET.include?(char)
#       new_arr << char
#     else
#       new_arr << ' ' unless new_arr.last == ' '
#     end
#   end
#   new_arr.join
# end

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
