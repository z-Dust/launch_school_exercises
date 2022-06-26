def triangle(angle_1, angle_2, angle_3)
  case
  when (angle_1 + angle_2 + angle_3 != 180) ||
       (angle_1 == 0 || angle_2 == 0 || angle_3 == 0)
    :invalid
  when angle_1 == 90 || angle_2 == 90 || angle_3 == 90
    :right
  when angle_1 > 90 || angle_2 > 90 || angle_3 > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
