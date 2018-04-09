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

  def getDepth(node)
    return 0 if node == nil
    l_height = getDepth(node.left)
    r_height = getDepth(node.right)
    if l_height > r_height
      return  l_height + 1
    else
      return r_height + 1
    end
  end

  def print_elem(root, level, odr)
    return if root == nil
    if level == 0
      print "#{root.val}"
    else
      if odr == true
        print_elem(root.right, level-1, odr)
        print_elem(root.left, level-1, odr)
      else
        print_elem(root.left, level-1, odr)
        print_elem(root.right, level-1, odr)
      end
    end
  end

  def spiral_print(root)
    ht = getDepth(root)
    counter = 0
    while counter < ht
      print_elem(root, counter, counter%2==0)
      puts ""
      counter+=1
    end
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
bt.spiral_print(bt.root)




#     6
#   3   8
#  1 4 7 9
#     5
