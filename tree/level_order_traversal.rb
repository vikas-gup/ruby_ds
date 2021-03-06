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

  def printNodesAtLevel(node, level)
    return if node == nil
    if level == 0
      print "#{node.val}, "
      return
    end
    printNodesAtLevel(node.left, level-1)
    printNodesAtLevel(node.right, level-1)
  end

  def level_order_traversal(root)
    height = get_max_depth(root)
    counter = 0
    while(counter < height)
      printNodesAtLevel(root, counter)
      puts ""
      counter+=1
    end
  end
end

bt = BinaryTree.new(1)
bt.root.left = Node.new(2, nil, nil)
bt.root.right = Node.new(3, nil, nil)
bt.root.left.left = Node.new(4, nil, nil)
bt.root.left.right = Node.new(5, nil, nil)
bt.root.left.right.right = Node.new(6, nil, nil)
bt.level_order_traversal(bt.root)
