class Triangle
  attr_accessor :sides
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end

    # if equilateral_equal_sides
    #   @kind = 'equilateral'
    # elsif isosceles_exactly_two_sides_equal
    #   @kind = 'isosceles'
    # elsif scalene_no_equal_sides
    #   @kind = 'scalene'
    # end
  end

  private

  def valid?
    # (@s1 > 0 && @s2 > 0 && @s3 > 0) && (((@s1 + @s2) > @s3) || ((@s1 + @s3) > @s2) || ((@s2 + @s3) > @s1))
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end



  # def equilateral_equal_sides
  #   @s1 == @s2 && @s1 == @s3
  # end

  # def isosceles_last_two_sides_equal
  #   @s2 == @s3
  # end

  # def isosceles_first_last_sides_equal
  #   @s1 == @s3
  # end

  # def isosceles_first_two_sides_equal
  #   @s1 == @s2
  # end

  # def isosceles_exactly_two_sides_equal
  #   isosceles_last_two_sides_equal && @s1 != @s2
  #   isosceles_first_last_sides_equal && @s1 != @s2
  #   isosceles_first_two_sides_equal && @s1 != @s3
  # end

  # def scalene_no_equal_sides
  #   @s1 != @s2 && @s1 != @s3
  # end
end
