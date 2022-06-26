module Walkable
  def walk
    puts "let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def greet
    puts "I'm a cat named #{name}"
  end
end

kitty = Cat.new('uhura')
kitty.greet
kitty.name = 'Luna'
kitty.greet

kitty.walk
