class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@no_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@no_of_vehicles += 1
  end

  def self.no_of_vehicles
    puts "number of vehicles is: #{@@no_of_vehicles}"
  end



  def self.gas_mileage(gallons, miles)
    puts "gas mileage is: #{miles/gallons}"
  end

  def spray_paint(new_color)
    self.color = new_color
  end

  def speed_up(num)
    @speed += num
    puts "you accelerate #{num} mph"
  end

  def brake(num)
    @speed -= num
    puts "you accelerate #{num} mph"
  end

  def current_speed
    puts "you are now going #{@speed} mph"
  end

  def shut_down
    @speed = 0
    puts 'The car has been shut off'
  end

  def age
    "your #{self.model} is #{years_old} years old"
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

module Haulable
  def haul?
    puts "This vehicle can haul heavy loads"
  end
end

class MyCar < Vehicle
  TYPE = 'car'

  def to_s
    "the car model is #{model}"
  end
end

class MyTruck < Vehicle
  TYPE = 'truck'

  include Haulable

  def to_s
    "the car model is #{model}"
  end
end

new_car = MyCar.new(1984, 'brown', 'Camero')
# puts new_car.year

# new_car.year = 2000
# new_car.speed_up(25)

lumina = MyCar.new(1997, 'white', 'chevy lumina')
# tesla = MyTruck.new(2020, 'black', 'tesla cyber truck')
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors
# lumina.speed_up(20 )
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# lumina.current_speed

# lumina.color = 'brown'
# puts lumina.color

# MyCar.gas_mileage(13,351)

# puts lumina

# puts lumina.age

class Student
  attr_accessor :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  protected
  def grade
    @grade
  end
end

joe = Student.new('Joe', 90)
bob = Student.new('Joe', 85)

# puts joe.grade

puts "Well done!" if joe.better_grade_than?(bob)

puts joe == bob

class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
puts priya.grade # => "A"
