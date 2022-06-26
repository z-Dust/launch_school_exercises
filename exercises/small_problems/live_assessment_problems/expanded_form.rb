=begin
  -given an integer, return a string which represents thta integer in 'expanded form', which is an expression consiting
  of addition of each tens places

  -input: integer, output: string

  - algorithm
    - convert integer to string
    - initialize empty string (return string)
    - loop over string
      - append ' + ' unless loop index == 0
      - append current char
      - append a number of zeros equal to index minus string length
    - return string

=end

def expanded_form(num)
  str = ''
  num.to_s.each_char.with_index do |char, i|
    if char != '0'
      str << ' + ' unless str.empty?
      str << char
      # ((num.to_s.size) - 1 - i).times { str << '0' }
      str << '0' * ((num.to_s.size) - 1 - i)
    end
  end
  p str
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

p expanded_form(70300) == '70000 + 300'
