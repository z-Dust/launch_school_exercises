class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if octal.match(/[^0-7]/)
    # octal.reverse.split('').map.with_index { |n, i| n.to_i * 8**i }.sum
    octal.to_i.digits.map.with_index { |n, i| n * 8**i }.sum
  end

  private

  attr_reader :octal
end
