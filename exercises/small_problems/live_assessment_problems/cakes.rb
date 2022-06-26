=begin
  problem- given two hash objects, determine if the second one has ingredients amounts which are equal to or greater than the first,
           and by how much, that is, if the second object has ingredients amounts greater than the first then return the smallest
           multiple among all ingredients between the second and first objects, if the second object does not have ingredient amounts
           which exceed the first, then return 0

  input- two hashes, output: integer

  algorithm-
    -initialize array to store multiples amounts
    -iterate over the recipe object
      -compare against in-house ingredients, against same key
        -if key not present return 0
        -if in-house ingredients does not at least equal recipe list then return 0
        -otherwise divide in-house by recipe and save result to array
    -return greatest value within multiples array
=end

def cakes(recipe, house)
  arr =[]
  recipe.each do |ingredient, amount|
    return 0 if !house.include?(ingredient) || house[ingredient] < amount
    arr << (house[ingredient] / amount)
  end
  arr.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
