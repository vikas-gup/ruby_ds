class Node
  attr_accessor :val, :left, :right
  def initialize(val, left, right)
      @val = val
      @left = left
      @right = right
  end
end

class BinaryTree
  attr_accessor :root
  def initialize(val)
    @root = Node.new(val, nil, nil)
  end

  def get_max_depth(node)
    return 0 if node == nil
    l_height = get_max_depth(node.left)
    r_height = get_max_depth(node.right)
    if l_height > r_height
      return  l_height + 1
    else
      return r_height + 1
    end
  end
end

bt = BinaryTree.new(1)
bt.root.left = Node.new(2, nil, nil)
bt.root.right = Node.new(3, nil, nil)
bt.root.left.left = Node.new(4, nil, nil)
bt.root.left.right = Node.new(5, nil, nil)
bt.root.left.right.right = Node.new(6, nil, nil)
puts bt.get_max_depth(bt.root)
