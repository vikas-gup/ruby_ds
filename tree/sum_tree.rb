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

  def sum_tree(node)
    return 0 if node == nil
    node.val + sum_tree(node.left) + sum_tree(node.right)
  end

  def is_sum_tree(node)
    return true if (node == nil or (node.left == nil and node.right == nil))
    is_equal = (node.val == sum_tree(node.left) + sum_tree(node.right))
    is_equal && is_sum_tree(node.left) && is_sum_tree(node.right)
  end
end

bt = BinaryTree.new(26)
bt.root.left = Node.new(10, nil, nil)
bt.root.right = Node.new(3, nil, nil)
bt.root.left.left = Node.new(4, nil, nil)
bt.root.left.right = Node.new(6, nil, nil)
bt.root.right.right = Node.new(3, nil, nil)
puts bt.is_sum_tree(bt.root)
