# delete nodes with val > x llist
class Node
  attr_accessor :val, :next
  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class LinkedList
  def initialize(val)
    @head = Node.new(val, nil)
  end

  def add(val)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(val, nil)
  end

  def delete(val)
    current = @head
    if current.val == val
      @head = current.next
    else
      while (current.next!=nil and current.next.val != val)
        current = current.next
      end
      if current.val != nil
        current.next = current.next.next
      end
    end
  end

  def printlist
    current = @head
    while current != nil
      puts current.val
      current = current.next
    end
  end
end

list = LinkedList.new(1)
list.add(2)
list.add(3)
list.add(4)
list.add(5)
list.add(6)
list.printlist
list.delete(6)
list.printlist
list.delete(1)
list.printlist
