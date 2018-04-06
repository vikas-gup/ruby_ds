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

  def nge(arr)
    i = 1
    while(i<arr.length)
      next_elem = arr[i]
      if @top != nil
        elem = pop()
        while (elem < next_elem)
          puts "#{elem} -- #{next_elem}"
          break if @top == nil
          elem = pop
        end
        push(elem) if elem > next_elem
      end
      push(next_elem)
      i+=1
    end
    while (@top != nil)
      elem = pop()
      puts "#{elem} -- -1"
    end
  end
end

arr = [4,3,5,6,1]
st = Stack.new(arr[0])
st.nge(arr)
