
def balanced?(str)

  parens = 0
  square = 0
  curly = 0
  single = true
  double = true
  str.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    square += 1 if char == '['
    square -= 1 if char == ']'
    curly += 1 if char == '{'
    curly -= 1 if char == '}'

    single = !single if char == '\''
    double = !double if char == "\""
    # if char.match?(/\(/)
    #   parens += 1
    # elsif char.match?(/\)/)
    #   parens -= 1
    # end
    # return false if parens < 0
    break if parens < 0 || square < 0 || curly < 0
  end

  parens == 0 && square == 0 && curly == 0 && single && double ? true : false

end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

p balanced?('sad"') == false
