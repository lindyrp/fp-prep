class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

class Stack
  attr_reader :first

  def initialize
    @first = nil
  end

  # Push a value onto the stack
  def push(value)
    @first = LinkedListNode.new(value, @first)
  end

  # Pop an item off the stack.  
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    return nil if empty?
    value = @first.value
    @first = @first.next_node
    value
  end

  def empty?
    @first.nil?
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  # create new stack
  rev_stack = Stack.new
  # loop through original linked list stack and push each node onto the stack
  while list != nil
    rev_stack.push(list.value)
    list = list.next_node
  end
  rev_stack.first
end

stack_a = Stack.new
node1 = stack_a.push(37)
node2 = stack_a.push(99)
node3 = stack_a.push(12)
print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)