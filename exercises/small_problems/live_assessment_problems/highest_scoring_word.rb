=begin
  algorithm-
    -initialize alphabet array
    -initialize return string, and score
    -split input string into array of words, iterate of array, then iterate over each char, sum score of word
      -if score if higher, set return string to word and score to current score
=end

ALPHA = ('a'..'z').to_a

def high(str)
  str.split.map do |word|
    [word, word.chars.map { |char| ALPHA.index(char) + 1 }.sum]
  end.max_by { |_, score| score }[0]
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
p high('what time are we climbing up the valcono volcano') == 'valcono'
