class CustomSet
  attr_reader :set

  def initialize(arr=[])
    @set = arr.uniq
  end

  def empty?
    set.empty?
  end

  def intersection(other_set)
    self.class.new(set.select { |ele| other_set.contains?(ele) })
  end

  def union(other_set)
    self.class.new((set + other_set.set.flatten).sort)
  end

  def difference(other_set)
    self.class.new(set.reject { |ele| other_set.contains?(ele) })
  end

  def disjoint?(other_set)
    set.none? { |ele| other_set.contains?(ele)}
  end

  def eql?(other_set)
    set.size == other_set.set.size && set.all? {|ele| other_set.contains?(ele)}
  end

  def ==(other_set)
    eql?(other_set)
  end

  def subset?(other_set)
    set.all? {|ele| other_set.contains?(ele)}
  end

  def contains?(ele)
    set.include?(ele)
  end

  def add(ele)
    set.push(ele) unless contains?(ele)
    self
  end
end
