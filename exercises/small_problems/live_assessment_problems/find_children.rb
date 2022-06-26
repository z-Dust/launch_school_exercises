=begin
  -given a string, return a string in aalphabetical order with uppercase letters directly followed by its lowercase version
  -input: string, output: string

  algorithm-
    -initialize arr
    -sort string, iterate over string and append uppercase letters to array, append corresponding lower letters to strings within array
=end

def find_children(str)
  new_str = ''
  str.chars.sort.each do |char|
    if char == char.upcase
      new_str << char
      str.each_char do |inner_char|
        new_str << inner_char if inner_char == char.downcase
      end
    end
  end
  new_str
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
