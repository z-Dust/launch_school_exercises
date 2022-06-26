=begin

  -given a string in camlCaase, return that string in kebab-case
  -return string should only contain lowercase letters, no numbers

  -input: string, output: string

  -algorithm
  -remove numbers from string
  -convert string into array of characters
  -iterate over char array, when capital letter is discovered, insert hyphen into array before capital letter
  -join array into string
  -downcase string

=end

def kebabize(str)
  str.gsub!(/[0-9]/, '')
  arr = str.chars

  counter = 0
  arr.each_with_index do |letter, i|
    if letter =~ /[A-Z]/
      str = str.chars.insert((i+counter), '-').join
      counter += 1
    end
  end
  str.downcase
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
