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

  def print_next_ancestor(root, node)
    return nil if root==nil
    if root.left == node or root.right == node
      return root
    else
      print_next_ancestor(root.left, node) || print_next_ancestor(root.right, node)
    end
  end

  def get_ancestors(node)
    node = print_next_ancestor(@root, node)
    puts node.val
    while node != nil
      node = print_next_ancestor(@root, node)
      puts node.val if node
    end
  end
end

bt = BinaryTree.new(1)
bt.root.left = Node.new(2, nil, nil)
bt.root.right = Node.new(3, nil, nil)
bt.root.left.left = Node.new(4, nil, nil)
bt.root.left.right = Node.new(5, nil, nil)
bt.root.left.right.right = Node.new(6, nil, nil)
bt.get_ancestors(bt.root.left.right.right)
