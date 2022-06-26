class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(length)
    raise ArgumentError if length > series.length

    # r_arr = Array.new
    # (series.length - length + 1).times do |n|
    #   r_arr.push(series.slice(n, length).split('').map(&:to_i))
    # end
    # r_arr

    series.chars.map(&:to_i).each_cons(length).to_a
  end
end
