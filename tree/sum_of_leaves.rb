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

  def get_leaves_sum(node, sum=0)
    return 0 if node == nil
    return node.val if node.left==nil and node.right==nil
    sum += (get_leaves_sum(node.left, sum) + get_leaves_sum(node.right, sum))
  end
end

bt = BinaryTree.new(1)
bt.root.left = Node.new(2, nil, nil)
bt.root.right = Node.new(3, nil, nil)
bt.root.left.left = Node.new(4, nil, nil)
bt.root.left.right = Node.new(5, nil, nil)
bt.root.left.right.right = Node.new(6, nil, nil)
puts bt.get_leaves_sum(bt.root)
