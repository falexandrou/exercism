# Hint: Not using Ruby's push / pop on purpose

class StackNode
  attr_reader :value
  attr_accessor :next

  def initialize value
    @value = value
  end
end

class Stack
  def initialize
    @top = nil
  end

  def push value
    node = StackNode.new(value)
    node.next = @top

    @top = node
  end

  def peek
    @top.value unless @top.nil?
  end

  def pop
    return false unless @top

    current_top = @top
    @top = @top.next

    current_top.value
  end

  def items
    return false unless @top

    current_top = @top

    nodes = []

    until current_top.nil? do
      nodes << current_top.value
      current_top = current_top.next
    end

    nodes
  end

  def length
    len = 0

    current_top = @top

    until current_top.nil? do
      len += 1
      current_top = current_top.next
    end

    len
  end

  def empty?
    @top.nil?
  end
end
