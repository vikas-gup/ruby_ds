class Node
  attr_accessor :val, :next
  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class Stack
  def initialize(val)
    @top = Node.new(val, nil)
  end

  def push(val)
    @top = Node.new(val, @top)
  end

  def pop
    if @top == nil
      puts "Empty stack"
      return
    end
    value = @top.val
    @top = @top.next
    value
  end
end

st = Stack.new(5)
st.push(4)
st.push(3)
st.push(2)
st.push(1)
puts st.pop
