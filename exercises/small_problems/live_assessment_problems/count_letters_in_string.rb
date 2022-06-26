def letter_count(str)
  letter_hash = {}

  str.each_char do |char|
    if char == char.downcase
      letter_hash[char.to_sym] = 0 if !letter_hash.has_key?(char.to_sym)
      letter_hash[char.to_sym] += 1
    end
  end

  letter_hash
end

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
