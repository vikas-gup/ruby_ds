class Node
  attr_accessor :val, :next
  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class Queue
  def initialize(val)
    @front = Node.new(val, nil)
    @rear = @front
  end

  def enqueue(val)
    @rear = Node.new(val, @rear)
  end

  def dequeue
    if @front == nil
      puts "Empty queue"
      return
    end
    value = @front.val
    @front = @front.next
    value
  end
end

qu = Queue.new(1)
qu.enqueue(2)
qu.enqueue(3)
qu.enqueue(4)
qu.enqueue(5)
puts qu.dequeue
