=begin
  -given a string return a new string in which every time a '#' appears the char immediately before it is deleted

  algorithm-
    -reverse string, iterate through chars
      -maintain octothorpe count, append char to new str if count is at 0
=end

def clean_string(str)
  new_str = ''
  count = 0
  str.reverse.each_char do |char|
    if char == '#'
      count += 1
    else
      count == 0 ? new_str << char : count -= 1
      # if count == 0
      #   new_str << char
      # else
      #   count -= 0
      # end
    end
  end
  new_str.reverse
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
