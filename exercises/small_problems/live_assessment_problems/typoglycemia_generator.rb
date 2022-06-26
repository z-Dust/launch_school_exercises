def scramble_words(str)
  str.split.map! do |word|
    chars = word.split('')

    special_chars = []
    chars.each.with_index { |char, i| special_chars << [char, i] if char =~ /(\.|,|'|-)/ }
    chars.delete_if { |char| char =~ /(\.|,|'|-)/}

    first = chars.delete_at(0)
    last = chars.delete_at(-1)

    chars.sort!
    chars.unshift(first).push(last)
    special_chars.each { |char, i| chars.insert(i, char) }
    chars.join
  end.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
