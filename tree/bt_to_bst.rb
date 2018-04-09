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

  def maxVal(root, max_val=0)
    return max_val if (root == nil)
    res = root.val
    lres = maxVal(root.left, res)
    rres = maxVal(root.right, res)
    res = if (lres > rres) then lres else rres end
  end

  def is_bst(root)
    return true if (root == nil)
    return ((root.left == nil or root.val > maxVal(root.left)) and (root.right == nil or root.val < maxVal(root.right)))
  end
end

bt = BinaryTree.new(6)
bt.root.left = Node.new(3, nil, nil)
bt.root.right = Node.new(8, nil, nil)
bt.root.left.left = Node.new(1, nil, nil)
bt.root.left.right = Node.new(4, nil, nil)
bt.root.left.right.right = Node.new(5, nil, nil)
# bt = BinaryTree.new(1)
# bt.root.left = Node.new(2, nil, nil)
# bt.root.right = Node.new(3, nil, nil)
# bt.root.left.left = Node.new(4, nil, nil)
# bt.root.left.right = Node.new(5, nil, nil)
# bt.root.left.right.right = Node.new(6, nil, nil)
puts bt.is_bst(bt.root)



#     6
#   3   8
#  1 4
#     5
