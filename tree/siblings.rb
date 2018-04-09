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

  def getNodeLevel(root, node, ht = 1)
    return 0 if root == nil
    if root == node
      return ht
    end
    l_lv =  getNodeLevel(root.left, node, ht+1)
    if l_lv != 0
      return l_lv
    else
      getNodeLevel(root.right, node, ht+1)
    end
  end

  def level_nodes(root, level, node)
    return if root == nil
    if level == 1 and root != node
      puts root.val
    else
      level_nodes(root.left, level-1, node)
      level_nodes(root.right, level-1, node)
    end
  end

  def cousin_nodes(root, level, node)
    if root == nil or level < 2
      return
    elsif level == 2
      return if root.left == node or root.right == node
      puts root.left.val if root.left
      puts root.right.val if root.right
    else
      cousin_nodes(root.left, level-1, node)
      cousin_nodes(root.right, level-1, node)
    end
  end

  def cousin_siblings(root, node)
    level = getNodeLevel(root, node)
    cousin_nodes(root, level, node)
  end

  def all_siblings(root, node)
    level = getNodeLevel(root, node)
    level_nodes(root, level, node)
  end
end

bt = BinaryTree.new(6)
bt.root.left = Node.new(3, nil, nil)
bt.root.right = Node.new(8, nil, nil)
bt.root.left.left = Node.new(1, nil, nil)
bt.root.left.right = Node.new(4, nil, nil)
bt.root.right.left = Node.new(7, nil, nil)
bt.root.right.right = Node.new(9, nil, nil)
bt.root.left.right.right = Node.new(5, nil, nil)
# bt = BinaryTree.new(1)
# bt.root.left = Node.new(2, nil, nil)
# bt.root.right = Node.new(3, nil, nil)
# bt.root.left.left = Node.new(4, nil, nil)
# bt.root.left.right = Node.new(5, nil, nil)
# bt.root.left.right.right = Node.new(6, nil, nil)
puts "Siblings for #{bt.root.left.right.val} - "
bt.all_siblings(bt.root, bt.root.left.right)
puts "Cousin Siblings for #{bt.root.left.right.val} - "
bt.cousin_siblings(bt.root, bt.root.left.right)



#     6
#   3   8
#  1 4 7 9
#     5
