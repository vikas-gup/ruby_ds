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

  def print_extreme_nodes(root, level, hsh = {}, width = 0)
    return if root == nil
    if level == 0
      hsh[width] = [] if hsh[width] == nil
      hsh[width] << root.val
    else
      print_extreme_nodes(root.left, level-1, hsh, width-1) if root.left
      print_extreme_nodes(root.right, level-1, hsh, width+1) if root.right
    end
    return hsh
  end

  def getDepth(root)
    return 0 if root == nil
    l_hgt = getDepth(root.left) + 1
    r_hgt = getDepth(root.right) + 1
    if l_hgt > r_hgt
      return l_hgt
    else
      return r_hgt
    end
  end

  def vertical_traverse(root)
    ht = getDepth(root)
    counter = 0
    hsh = {}
    while counter < ht
      hsh = print_extreme_nodes(root, counter, hsh)
      counter+=1
    end
    puts hsh
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
bt.vertical_traverse(bt.root)




#     6
#   3   8
#  1 4 7 9
#     5
