=begin

-given a string, count the number of unnique case-insensitive letters and digits that occur more than once
-input: string, output: integer

algorithm-
  -initialize counter
  -downcase the string
  -iterate over the string, find the count of each character
    -if the count is creater than 1, then increment counter
  -return counter

=end

def duplicate_count(str)
  counter = 0
  arr = []
  new_str = str.downcase
  new_str.each_char do |char|
    if new_str.count(char) > 1 && !arr.include?(char)
      arr << char
      counter += 1
    end
  end
  counter
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
