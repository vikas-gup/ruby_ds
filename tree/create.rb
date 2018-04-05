class Node
  attr_accessor :val, :left, :right
  def initialize(val, left_node, right_node)
    @val = val
    @left = left_node
    @right = right_node
  end
end

class Tree
  def initialize(val)
    @root = Node.new(val, nil, nil)
    @root.left = Node.new(2, nil, nil)
    @root.right = Node.new(3, nil, nil)
    @root.left.left = Node.new(4, nil, nil)
    @root.left.right = Node.new(5, nil, nil)
  end

  def preOrderTraverse(root= @root)
    if root != nil
      puts root.val
      preOrderTraverse root.left
      preOrderTraverse root.right
    end
  end

  def inOrderTraverse(root= @root)
    if root != nil
      preOrderTraverse root.left
      puts root.val
      preOrderTraverse root.right
    end
  end

  def postOrderTraverse(root= @root)
    if root != nil
      preOrderTraverse root.left
      preOrderTraverse root.right
      puts root.val
    end
  end
end

tree = Tree.new(1)
tree.preOrderTraverse
tree.inOrderTraverse
tree.postOrderTraverse
