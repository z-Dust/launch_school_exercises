# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end



# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo)
    if new_todo.class == Todo
      @todos.push(new_todo)
    end
  end

  def <<(new_todo)
    add(new_todo)
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def done?
    # @todos.each do |todo|
    #   return false if todo.done? == false
    # end
    # true
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    raise IndexError, 'index value is invalid' if idx > @todos.size - 1
    @todos[idx]
  end

  def mark_done_at(idx)
    @todos[idx].done!
  end

  def mark_undone_at(idx)
    @todos[idx].undone!
  end

  def done!
    @todos.each do |todo|
      todo.done!
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete_at(idx)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    # new_arr = []
    # @todos.each do |todo|
    #   new_arr << todo.to_s
    # end
    # new_arr
    @todos.clone
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  # def select
  #   @todos.select do |todo|
  #     yield(todo)
  #   end
  # end

  def select
    new_list = TodoList.new("")

    each do |todo|
      new_list << todo if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    each do |todo|
      return todo if todo.title == title
    end
    nil
  end

  def all_done
    new_list = TodoList.new("")
    each do |todo|
      new_list << todo if todo.done?
    end
    new_list
  end

  def all_not_done
    new_list = TodoList.new("")
    each do |todo|
      new_list << todo if !todo.done?
    end
    new_list
  end

  def mark_done(title)
    # todo = find_by_title(title)
    # if todo == nil
    #   puts "no Todo item by that name"
    # else
    #   find_by_title(title).done!
    # end
    # return puts "no Todo item by that name" if find_by_title(title) == nil
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

# given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# todo1.done!
# todo2.done!
# todo3.done!

# ---- Adding to the list -----

# add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# p list.find_by_title("Clean room")



# todo1.done!
# todo2.done!

# list.mark_done("Buy milk")
# puts list.all_done

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect


# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

=begin
# <<
# same behavior as add

# ---- Interrogating the list -----

# size
puts list.size                       # returns 3

# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

#to_a
puts list.to_a                      # returns an array of all items in the list

#done?
puts list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# puts list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
puts list.done!                   # marks all items as done
puts ''

# ---- Deleting from the list -----

# shift
# puts list.shift                      # removes and returns the first item in list
# puts ''

# pop
# puts list.pop                        # removes and returns the last item in list
# puts ''

# remove_at
# list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError
# puts list.to_a

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

puts list

list.pop

puts list

list.mark_done_at(1)

puts list



# in temp.rb
require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end
=end
