def danish(str)
  p str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

danish('The cherry of my eye')
# -> 'The danish of my eye'

danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

danish('I love pineapple')
# -> 'I love pineapple'
