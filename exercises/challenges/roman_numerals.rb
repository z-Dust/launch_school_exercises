module Conversion
  Table = {
    3000 => 'MMM', 2000 => 'MM', 1000 => 'M',
    900 => 'CM', 800 => 'DCCC', 700 => 'DCC', 600 => 'DC', 500 => 'D', 400 => 'CD', 300 => 'CCC', 200 => 'CC',
    100 => 'C', 90 => 'XC', 80 => 'LXXX', 70 => 'LXX', 60 => 'LX', 50 => 'L', 40 => 'XL', 30 => 'XXX', 20 => 'XX',
    10 => 'X', 9 => 'IX', 8 => 'VIII', 7 => 'VII', 6 => 'VI', 5 => 'V', 4 => 'IV', 3 => 'III', 2 => 'II', 1 => 'I'
  }
end

class RomanNumeral
  attr_accessor :decimal

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    roman = ''
    factor = 1000
    loop do
      if decimal >= factor
        roman << Conversion::Table[factor * (decimal / factor)]
        self.decimal -= (factor * (decimal / factor))
      end

      factor /= 10
      break if factor < 1
    end
    roman
  end
end
