class Node
  attr_accessor :value, :left, :right

  def initialize value
    @value = value
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize root_value = nil
    @root = Node.new(root_value)
  end

  def insert value
    current_node = @root

    while current_node != nil do
      if current_node.value > value && current_node.left.nil?
        current_node.left = Node.new(value)
      elsif current_node.value < value && current_node.right.nil?
        current_node.right = Node.new(value)
      elsif current_node.value > value
        current_node = current_node.left
      elsif current_node.value < value
        current_node = current_node.right
      else
        current_node = nil
      end
    end

    current_node
  end

  def insert_recursive value, current_node=@root
    if current_node.nil?
      current_node = Node.new(value)
      return current_node
    end

    if current_node.value > value
      current_node.left = insert_recursive(value, current_node.left)
    elsif current_node.value < value
      current_node.right = insert_recursive(value, current_node.right)
    end

    current_node
  end

  def pre_order_traversal current_node=@root, path=[]
    return if current_node.nil?

    pre_order_traversal(current_node.left, path)
    pre_order_traversal(current_node.right, path)
    path.push current_node.value

    path
  end

  def in_order_traversal current_node=@root, path = []
    return if current_node.nil?

    in_order_traversal(current_node.left, path)
    path.push current_node.value
    in_order_traversal(current_node.right, path)

    path
  end

  def post_order_traversal current_node=@root, path = []
    return if current_node.nil?

    path.push current_node.value
    post_order_traversal(current_node.left, path)
    post_order_traversal(current_node.right, path)

    path
  end

  def count
    pre_order_traversal.length
  end

  def valid? current_node=@root
    until current_node.left.nil? && current_node.right.nil? do
      if current_node.value < current_node.left.value || current_node.value > current_node.right.value
        return false
      end

      return valid?(current_node.left) && valid?(current_node.right)
    end

    return true
  end

  def contains? value, current_node=@root
    if current_node.value == value
      return true
    elsif current_node.left && current_node.value > value
      return contains?(value, current_node.left)
    elsif current_node.right && current_node.value < value
      return contains?(value, current_node.right)
    end

    false
  end

  def clear!
    @root = nil
  end

  def remove value, current_node=@root
    return if current_node.nil?

    if current_node.value < value
      return remove(value, current_node.right)
    elsif current_node.value > value
      return remove(value, current_node.left)
    else
      # only 1 child present
      return current_node.left if current_node.right.nil?
      return current_node.right if current_node.left.nil?

      # both children present
      current_node.value = leftmost(current_node.right).value
      current_node.right = remove(current_node.value, current_node.right)
    end

    current_node
  end

  private

  def leftmost node
    min = node.value

    until node.left.nil?
      min   = node.left.value
      node  = node.left
    end

    node
  end
end
