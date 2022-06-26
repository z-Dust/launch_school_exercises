def reverse_words(str)
  str_arr = str.split
  str_arr.map! { |word| word.size > 4 ? word.reverse : word }
  str_arr.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS'
