hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowel_arr = []
hsh.each_value do |words|
  words.join.each_char do |char|
    vowel_arr << char if char.match(/[aeiou]/)
    # puts char if char.match(/[aeiou]/)
  end
end

p vowel_arr
