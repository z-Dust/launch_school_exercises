def repeater(str)
  new_str = ''
  str.each_char { |char| new_str << char << char }
  new_str
end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

def double_consonants(str)
  new_str = ''
  str.each_char do |char|
    new_str << char
    new_str << char if char =~ /[bcdfghjklmnpqrstvwxyz]/i
  end
  p new_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
