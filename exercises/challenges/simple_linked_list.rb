class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    !@next_element
  end

  # def next
  #   @next_element
  # end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(arr=[])
    arr.nil? ? new : arr.reverse.each_with_object(new) { |datum, list| list.push(datum) }
  end

  def to_a
    arr = []
    loop_head = head
    until loop_head.nil?
      arr.push(loop_head.datum)
      loop_head = loop_head.next
    end
    arr
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def size
    to_a.size
  end

  def empty?
    head.nil?
  end

  def peek
    # head == nil ? head : head.datum
    head.datum if head
  end

  def pop
    old_head = head
    @head = @head.next
    old_head.datum
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end
