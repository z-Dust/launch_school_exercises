def greetings(arr, hsh)
  puts "Hello #{arr.join(' ')}! "\
       "Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
