def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  str = str.downcase.delete('^a-z0-9')
  palindrome?(str)
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# p palindrome?(['m', 'a', 'm']) == true
