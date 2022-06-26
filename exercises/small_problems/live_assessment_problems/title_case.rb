=begin
  - given a string and an optional set of 'minor words', return the string in title case
  - title case: each word is capitalized unless it is a minor word, the first word is always capitalized

  - input: string, and optional string, output: string

  - algorithm
    -split string into array
    -iterate over string array
      -capitalize each word unless it is present in minor words array
    -join string array and return

=end

def title_case(str, *minor_words)
  arr = str.split
  first_word = arr.shift

  if minor_words.empty?
    arr.map { |word| word.capitalize }.unshift(first_word.capitalize).join(' ')
  else
    arr.map do |word|
      if minor_words[0].downcase.split.any?(word.downcase)
        word.downcase
      else
        word.capitalize
      end
    end.unshift(first_word.capitalize).join(' ')
  end
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
