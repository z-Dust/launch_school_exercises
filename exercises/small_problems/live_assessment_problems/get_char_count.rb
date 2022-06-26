=begin
  - given a string, return a hash with values as letters and keys as the number of occurences of those letters
  - characters should be sorted alphabetically
  - ignore punctuation and spaces
  - case insensitive

  - input: string, output: hash

  - algorithm
    -initialize hash
    -remove spaces and punctution from string, and downcase
    -iterate over string
      -check if current char exists in array, if it does, skip, if not then process
        -count number of current char occurences and add letter to array
      -check if hash has count key already
        -if it does, add current letter to value array
        -if not, then add key count and letter value
      return hash
=end

def get_char_count(str)
  letter_count_hsh = {}
  tracking_arr = []
  new_str = str.gsub(/[( |.|!|?)]/, '').downcase
  new_str.each_char do |char|
    next if tracking_arr.include?(char)
    tracking_arr << char
    count = new_str.count(char)
    if letter_count_hsh.has_key?(count)
      letter_count_hsh[count] << char
    else
      letter_count_hsh[count] = [char]
    end
  end
  letter_count_hsh.each { |k, v| v.sort!}
end

p get_char_count("cba") == {1=>["a", "b", "c"]}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
