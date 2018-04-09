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

  def level_nodes(root, level)
    return if root == nil
    if level == 1
      puts root.val
    else
      level_nodes(root.left, level-1)
      level_nodes(root.right, level-1)
    end
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
bt.level_nodes(bt.root, 3)



#     6
#   3   8
#  1 4
#     5
