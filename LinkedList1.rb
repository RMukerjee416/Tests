
class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    while @data != nil
      head = @data.value     # store value of "top plate" in a variable
      @data = @data.next_node   # reassign "second plate" (next node) as the new topper
      return head    # extract the original first node or "pop" it out
    end
  end
end

# original function as set out in lesson
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

# method for reversing list
def reverse_list(list)
  stack_initial = Stack.new

  while list
    # storing head of list to initial stack
    stack_initial.push(list.value)
    # next node becomes new head - removing original head from list 
    list = list.next_node     
  end

  # collect heads (via "pop") and store in a different stack
  # this will ultimately result in a reversal
  stack_final = Stack.new
  value = stack_initial.pop
  while value   # loop to account for all heads in sequence
    stack_final.push value
    value = stack_initial.pop
  end

  # rebuilding Linked List with latest stack (via "pop" again)
  # the head collected last will end up appearing first (LIFO)
  flipped_list = nil
  value = stack_final.pop
  while value
    flipped_list = LinkedListNode.new(value, flipped_list)
    value = stack_final.pop
  end

  flipped_list

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)