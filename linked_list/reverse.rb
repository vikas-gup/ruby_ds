class Node
  attr_accessor :val, :next
  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class Linkedlist
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

  def remove(val)
    current = @head
    return if current == nil
    while current.next!=nil && current.next.val != val
      current = current.next
    end
    unless current.next == nil
      current.next = current.next.next
    end
  end

  def reverse
    prev = nil
    current = @head
    nxt = nil
    while current != nil
      nxt = current.next
      current.next = prev
      prev = current
      current = nxt
    end
    @head = prev
  end

  def remove_big_number(val)
    current = @head
    prev = nil
    while current != nil
      if current.val > val
        current = current.next
      else
        @head = current
        break
      end
    end
    prev = current
    current = current.next
    while current != nil
      prev.next = current.next if current.val > val
      prev = current
      current = current.next
    end
  end

  def printList
    current = @head
    while current != nil
      puts current.val
      current = current.next
    end
  end
end

lst = Linkedlist.new(1)
lst.add(2)
lst.add(3)
lst.add(4)
lst.add(5)
lst.add(6)
lst.printList
puts "-------"
lst.remove(5)
lst.remove(7)
lst.printList
puts "-------"
lst.reverse
lst.printList
puts "-------"
lst.remove_big_number(3)
lst.printList
