class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def reverse_list(list, previous=nil)
  if list
    next_node = list.next_node
    list.next_node = previous
    reverse_list(next_node, list)
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

def infinite_loop?(list)
  scarlet = list.next_node
  gray = list.next_node

  until gray.nil?
    gray = gray.next_node
    return false if gray.nil?

    gray = gray.next_node
    scarlet = scarlet.next_node
    return true if gray == scarlet
  end

  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)


print_values(node3)
puts "---------"
reverse_list(node3)
print_values(node1)

puts infinite_loop?(node3)
node1.next_node = node3 # creates an infinite loop
puts infinite_loop?(node3)