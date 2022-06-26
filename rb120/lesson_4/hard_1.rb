# class SecretFile
#   # attr_reader :data

#   def initialize(secret_data, logger)
#     @data = secret_data
#     @logger = logger
#   end

#   def data
#     logger.create_log_entry
#     @data
#   end
# end

# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end


#  module WheeledVehicle
#   attr_accessor :tires

#   def wheels(tire_array)
#     @tires = tire_array
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end

# class Vehicle
#   attr_accessor :speed, :heading

#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class Auto < Vehicle
#   include WheeledVehicle

#   def initialize
#     # 4 tires are various tire pressures
#     super(50, 25.0)
#     wheels([30,30,32,32])
#   end
# end

# class Motorcycle < Vehicle
#   include WheeledVehicle

#   def initialize
#     # 2 tires are various tire pressures
#     super(80, 8.0)
#     wheels([20,20])
#   end
# end

# class Catamaran < Vehicle
#   attr_reader :propeller_count, :hull_count
#   attr_accessor :speed, :heading

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls
#   end
# end
# catamaran = Catamaran.new(4, 2, 50, 500)
# car = Auto.new()
# p catamaran.propeller_count

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range

  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Seacraft
  include Moveable

  attr_reader :hull_count, :propeller_count

  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = fuel_efficiency
    self.fuel_capacity = fuel_capacity
  end

  def range
    super + 10
  end
end

class Catamaran < Seacraft; end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # set up 1 hull and 1 propeller
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end
