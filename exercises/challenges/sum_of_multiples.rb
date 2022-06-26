class SumOfMultiples
  attr_reader :multiples

  def initialize(*args)
    @multiples = args.empty? ? [3, 5] : args
  end

  def self.to(limit)
    SumOfMultiples.new().to(limit)
  end

  def to(limit)
    multiples.flat_map { |n| (0..(limit - 1)).step(n).to_a }.uniq.sum
  end
end
