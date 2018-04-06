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

  def merge_linked_list(head1, head2)
    return head2 if head1 == nil
    return head1 if head2 == nil
    if head1.val <= head2.val
      Node.new(head1.val, merge_linked_list(head1.next, head2))
    else
      Node.new(head2.val, merge_linked_list(head1, head2.next))
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

lst1 = Linkedlist.new(1)
lst2 = Linkedlist.new(2)
lst1.add(3)
lst2.add(4)
lst1.add(5)
lst2.add(6)
lst1.printList
puts "-------"
lst2.printList
new_list = Linkedlist.new(nil)
new_list.head = new_list.merge_linked_list(lst1.head, lst2.head)
puts "-------"
new_list.printList
