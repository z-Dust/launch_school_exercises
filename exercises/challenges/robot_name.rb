class Robot
  @@robots = []

  def name
    loop do
      return @name if @name
      new_name = generate_name
      @name = @@robots.include?(new_name) ? nil : new_name
      @@robots.push(@name) if @name
    end
  end

  def generate_name
    (Array.new(2).map { |letter| ('A'..'Z').to_a.sample } +
    Array.new(3).map { |letter| ('0'..'9').to_a.sample }).join
  end

  def reset
    @@robots.delete(@name)
    @name = nil
  end
end
