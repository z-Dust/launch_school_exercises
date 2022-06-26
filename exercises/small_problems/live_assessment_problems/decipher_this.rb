=begin
  -given an encrypted string, decrypt it.
    -rules:
      -the second and last letters of each word are switched
      -the first letter is replaced with its character code
    -only letters, numbers, and spaces
    -input: string, output:

    algorithm-
      -split the string into an array of words
      -iterate over word array, testing for numbers, until non-number is found, this is the character code
        -convert char code into letter, prepend to word, and switch second and last letters
      -join word array into string and return
=end
def decipher_this(str)
  str.split.map do |word|
    char_code = ''
    word.each_char do |char|
      if char == char.to_i.to_s
        char_code << char
      end
    end

    a = word[char_code.size, word.size - char_code.size]
    if a.size == 0
      char_code.to_i.chr
    else
      a[0], a[-1] = a[-1], a[0]
      "#{char_code.to_i.chr}#{a}"
    end
  end.join(' ')
end


p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
