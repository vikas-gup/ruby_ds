require 'byebug'
class Node
  attr_accessor :val, :next
  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class Linkedlist
  attr_accessor :head
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

  def removeLoop(loop_p)
    current = @head.next
    while (loop_p.next != current.next)
      loop_p = loop_p.next
      current = current.next
    end
    loop_p.next = nil
  end

  def detectLoop
    flag = false
    slow_p = @head
    fast_p = @head
    slow_p = slow_p.next
    fast_p = fast_p.next.next
    while (fast_p!=nil and fast_p.next != nil)
      if slow_p == fast_p
        flag = true
        break
      end
      slow_p = slow_p.next
      fast_p = fast_p.next.next
    end
    puts slow_p.val
    removeLoop(fast_p) if flag
    return flag
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
lst.head.next.next.next.next.next.next = lst.head.next.next
puts lst.detectLoop
puts "-------"
#lst.printList
