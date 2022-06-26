class Pet
  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def fetch
    'fetching!'
  end

  def speak
    'bark!'
  end
end

class Cat < Pet
  def speak
    'Meow!'
  end
end

class Bulldog < Dog
  def swim
    puts "can't swim"
  end
end



teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
