def remove_vowels(arr)
  arr.each { |str| str.gsub!(/[aeiou]/i, '') }
end

# def remove_vowels(strings)
#   strings.map { |string| string.delete('aeiouAEIOU') }
# end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
