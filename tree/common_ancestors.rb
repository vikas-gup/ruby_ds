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
    arr = []
    node = print_next_ancestor(@root, node)
    arr.push(node)
    while node != nil
      node = print_next_ancestor(@root, node)
      arr.push(node) if node != nil
    end
    arr
  end
end

bt = BinaryTree.new(1)
bt.root.left = Node.new(2, nil, nil)
bt.root.right = Node.new(3, nil, nil)
bt.root.left.left = Node.new(4, nil, nil)
bt.root.left.right = Node.new(5, nil, nil)
bt.root.left.right.right = Node.new(6, nil, nil)
node1 = bt.root.left.right.right
node2 = bt.root.left
arr1 = bt.get_ancestors(node1)
arr2 = bt.get_ancestors(bt.root.left.right)
puts node1.val
puts node2.val
new_arr = (arr1 & arr2).map{|x| x.val}
puts new_arr.first
