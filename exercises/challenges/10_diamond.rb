class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(depth)
    reverse_arr = []
    str = []
    ALPHABET.each do |letter|
      if letter == 'A'
        str << "#{letter.center(calculate_width(depth))}\n"
      else
        str << "#{letter}#{" "*calculate_whitespace_width(letter)}#{letter}".center(calculate_width(depth)) + "\n"
      end
      break if letter == depth
      reverse_arr << letter
    end

    reverse_arr.reverse.each do |letter|
      if letter == 'A'
        str << "#{letter.center(calculate_width(depth))}\n"
      else
        str << "#{letter}#{" "*calculate_whitespace_width(letter)}#{letter}".center(calculate_width(depth)) + "\n"
      end
    end
    str.join
  end

  def self.calculate_whitespace_width(depth)
    width = ALPHABET.find_index(depth) * 2 - 1
    width > 0 ? width : 0
  end

  def self.calculate_width(depth)
    width = ALPHABET.find_index(depth) * 2 - 1
    width > 0 ? width + 2 : 0
  end
end
