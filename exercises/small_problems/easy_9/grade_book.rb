def get_mean(n1, n2, n3)
  (n1 + n2 + n3) / 3
end

def get_grade(n1, n2, n3)
  case get_mean(n1, n2, n3)
  when 90.. then 'A'
  when 80..89
    'B'
  when 70..79
    'C'
  when 60..69
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
