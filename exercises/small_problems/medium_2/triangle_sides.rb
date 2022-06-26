def triangle(side_1, side_2, side_3)
  return :invalid if side_1 <= 0 || side_2 <= 0 || side_3 <= 0

  arr = [side_1, side_2, side_3]
  arr.sort!

  return :invalid if arr[0] + arr[1] < arr[2]
  return :scalene if arr[0] != arr[1] && arr[1] != arr[2]
  return :equilateral if arr[0] == arr[1] && arr[1] == arr[2]
  :isosceles
  # return :isosceles if (arr[0] == arr[1] && arr[1] != arr[2]) ||
  #                      (arr[0] == arr[2] && arr[1] != arr[2]) ||
  #                      (arr[1] == arr[2] && arr[1] != arr[0])
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
