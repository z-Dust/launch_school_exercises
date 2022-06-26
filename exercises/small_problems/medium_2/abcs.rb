LETTERS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(str)
  bool = true
  LETTERS.each do |letters|
    str.upcase.each_char do |char_1|
      if char_1 == letters[0]
        str.upcase.each_char { |char_2| bool = false if char_2 == letters[1] }
      end
    end
  end
  bool
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('bomb') == false
p block_word?('eagle') == true
p block_word?('jw') == false
p block_word?('BATCHB') == false # this one is not true, block is used twice, didn't understand thta requirement
