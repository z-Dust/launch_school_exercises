class Person
  attr_accessor :name, :first_name, :last_name

  def initialize(name)
    first_and_last = name.split
    @first_name = first_and_last.first
    @last_name = first_and_last.last if first_and_last.size > 1
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end
  private

  def parse_full_name(names)
    first_and_last = names.split
    @first_name = first_and_last.first
    @last_name = first_and_last.last if first_and_last.size > 1
  end
end

# bob = Person.new('Bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# puts bob.first_name            # => 'John'
# puts bob.last_name             # => 'Adams'

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
